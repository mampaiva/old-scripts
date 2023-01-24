#!/bin/bash

name=nevpt2-mf-h
oname=mf-h-cas
orcapath=/usr/local/orca503

for (( j = 01 ; j <= 9; j++ ))
    do
    
cat > $name-$j.inp << EOF
%Pal nprocs 6 end
%MaxCore 1000
! UHF aug-cc-pVTZ  
%moinp "$oname.00$j.gbw"
%casscf nel 2
        norb 4
        nroots 2
        mult 1,3
        PTMethod SC_NEVPT2
end
* xyzfile 0 1 $oname.00$j.xyz
EOF

nohup $orcapath/orca $name-$j.inp >& $name-$j.out
   done 
   
for (( j = 10 ; j <= 60; j++ ))
    do
    
cat > $name-$j.inp << EOF
%Pal nprocs 6 end
%MaxCore 1000
! UHF aug-cc-pVTZ  
%moinp "$oname.0$j.gbw"
%casscf nel 2
        norb 4
        nroots 2
        mult 1,3
        PTMethod SC_NEVPT2
end
* xyzfile 0 1 $oname.0$j.xyz
EOF
nohup $orcapath/orca $name-$j.inp >& $name-$j.out
   done 
