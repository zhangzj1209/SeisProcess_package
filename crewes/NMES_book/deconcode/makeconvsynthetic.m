dt=.002;
tmax=2;
fdom=20;
tlen=.5*tmax;
s2n=4;
[r,t]=reflec(tmax,dt,.1,3,pi);%change the last argument (currently pi) to any other number to get a different reflectivity
[w,tw]=wavemin(dt,fdom,tlen);
s=convm(r,w);
sn=s+rnoise(s,s2n);