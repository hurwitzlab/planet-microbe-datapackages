import graphlab
import argparse
import sys
import math
import numpy as np

def get_args():
    """get args"""
    parser = argparse.ArgumentParser(description='Bagging model builder',formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('-BCO', '--BCODMO', help='BCODMO dataset',
                        metavar='BCODMO', type=str, required=True)
    parser.add_argument('-r', '--res', help='research dataset',
                        metavar='res', type=str, required=True)
    parser.add_argument('-o', '--out', help='outfile',
                        metavar='out', type=str, required=True)
    parser.add_argument('-d', '--dep', help='range depth',
                        metavar='dep', type=int, required=True)
    return parser.parse_args()


def get_depth(p, lat):
     g0 =  9.780318
     g1 =  5.2788e-03
     g2 =  2.3600e-05
     up =  2.1840e-06
     c1 =  9.72659
     c2 = -2.2512e-05
     c3 =  2.2790e-10
     c4 = -1.8200e-15     
     s = math.sin((lat*math.pi)/180)
     g = g0*(1.0 + g1*math.pow(s, 2) + g2*math.pow(s, 4));
     x = c1*p + c2*math.pow(p, 2) + c3*math.pow(p, 3) + c4*math.pow(p, 4)
     y = g + (up*p)/2
     z = x/y
     return z



def main():
    args = get_args()
    BCO_file = args.BCODMO
    res_file = args.res
    out_file = args.out
    range = args.dep
#################LOADING CTD######################################################
    BCOData=graphlab.SFrame()
    column_type_hints=[int,int,int,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,str,float,str]
    BCOData=graphlab.SFrame.read_csv(BCO_file, delimiter=",", header=True, column_type_hints=column_type_hints)
    print(BCOData.shape)
################CONVERSION PRESSURE - DEPTH#########################################
   # define vectorized function
    #get_depth_v = np.vectorize(get_depth)
   #export lat and pressure as NumPy arrays
    #lat=BCOData['lat'].to_numpy()
    #pres=BCOData['CTDPRS'].to_numpy()

    #calc_depth=get_depth_v(pres, lat)
    #my_depth=graphlab.SArray(data=calc_depth, dtype=float, ignore_cast_failure=False)
    #BCOData.add_column(my_depth, name='inferred_depth')
####################MAPPING#########################################################
    checker=0
    count_line=0
    mapData=graphlab.SFrame()
    f = open(res_file, 'r')
    for line in f:

         currData=graphlab.SFrame()
         record=graphlab.SFrame()
         count_line=count_line+1
         
         print("------------------------------------------------")
         cruise,date,station,cast,depth,sample=line.split(',')
         print(cruise)
         currData=BCOData[(BCOData['cruise_name']==int(cruise)) & (BCOData['station']==int(station)) & (BCOData['cast']==int(cast))]
         print(currData.shape)
         sa = graphlab.SArray([sample])
         
         print("station"+station+" - depth="+depth)
         if currData[(currData['inferred_depth']==float(depth))]:
             print("depth found")
             record=currData[(currData['inferred_depth']==float(depth))]
             print(record.shape)
             record.add_column(sa, name='sample')
             print(record)
             
         else:
             print("depth not in file")

             if currData[(currData['inferred_depth']>(float(depth)-float(range))) & (currData['inferred_depth']<(float(depth)+float(range)))]:
                  print("cdt in proximity found")
                  close_ctd=currData[(currData['inferred_depth']>(float(depth)-float(range))) & (currData['inferred_depth']<(float(depth)+float(range)))]
                  close_depth=close_ctd['inferred_depth'].to_numpy()               

                  closest_depth=100000.0
                  min_dist=float(range)+1
                  for x in np.nditer(close_depth):
                      print("depth "+str(x))
                      d=float(depth)-float(x)
                      dist=math.fabs(d)
                      if dist< min_dist:
                          min_dist=dist
                          closest=float(x)
                      elif (dist==min_dist and float(x)<closest):
                          min_dist=dist
                          closest=float(x)
                      
                  print("closest ctd cast :"+str(closest))

                  record=currData[(currData['inferred_depth']==closest)]
                  print(record.shape)
                  record.add_column(sa, name='sample')
                                                     
             else:
                  print("no records found in close proximity")
                  checker=checker+1
                  
             print(record)
             if count_line==1:
                 mapData=record
             else:
                 mapData=mapData.append(record)

    print("Couldn't map "+str(checker)+" samples to the CTD profiles")
    mapData.export_csv(out_file, delimiter=', ', line_terminator='\n', header=True)
  
if __name__ == '__main__':
    main()
