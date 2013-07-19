[nza,nzb] = testV47nonzeros;
[nzat,nzbt] = testV57nonzeros;
[za,zb] = testV47zeros;
[zat,zbt] = testV57zeros;
[ca,cb] = testV47complete;
[cat,cbt] = testV57complete;




ttestValuenz = zeros(2,5);
ttestValuez = zeros(2,5);
ttestValuec = zeros(2,5);

for k = 1:5
    [~,ttestValuenz(1,k)] = ttest2(nza{k}.error,nzat{k}.error);
    [~,ttestValuenz(2,k)] = ttest2(nzb{k}.error,nzbt{k}.error);
    
    [~,ttestValuez(1,k)] = ttest2(za{k}.error,zat{k}.error);
    [~,ttestValuez(2,k)] = ttest2(zb{k}.error,zbt{k}.error);
    
    [~,ttestValuec(1,k)] = ttest2(ca{k}.error,cat{k}.error);
    [~,ttestValuec(2,k)] = ttest2(cb{k}.error,cbt{k}.error);
end
beep