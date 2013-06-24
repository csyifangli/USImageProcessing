function plotFig(path)
close all;
% open figure and get handle to axes of figure
h1 = openfig([path filesep '1.fig'],'reuse'); 
ax1 = gca; 
h2 = openfig([path filesep '2.fig'],'reuse');
ax2 = gca;
h3 = openfig([path filesep '3.fig'],'reuse');
ax3 = gca;
h4 = openfig([path filesep '4.fig'],'reuse');
ax4 = gca;
h5 = openfig([path filesep '5.fig'],'reuse'); 
ax5 = gca; 
h6 = openfig([path filesep '6.fig'],'reuse');
ax6 = gca;
h7 = openfig([path filesep '7.fig'],'reuse');
ax7 = gca;
h8 = openfig([path filesep '8.fig'],'reuse');
ax8 = gca;

h9 = figure; %create new figure
s1 = subplot(2,4,1);
axis ij;
axis([1 505 1 526])
s2 = subplot(2,4,2);
axis ij;
axis([1 505 1 526])
s3 = subplot(2,4,3);
axis ij;
axis([1 505 1 526])
s4 = subplot(2,4,4);
axis ij;
axis([1 505 1 526])
s5 = subplot(2,4,5);
axis ij;
axis([1 505 1 526])
s6 = subplot(2,4,6);
axis ij;
axis([1 505 1 526])
s7 = subplot(2,4,7);
axis ij;
axis([1 505 1 526])
s8 = subplot(2,4,8);
axis ij;
axis([1 505 1 526])

%get handle to all the children in the figure
fig1 = get(ax1,'children');
fig2 = get(ax2,'children');
fig3 = get(ax3,'children'); 
fig4 = get(ax4,'children');
fig5 = get(ax5,'children'); 
fig6 = get(ax6,'children');
fig7 = get(ax7,'children'); 
fig8 = get(ax8,'children');
colormap gray

%copy children to new parent axes i.e. the subplot axes
copyobj(fig1,s1); 
copyobj(fig2,s2);
copyobj(fig3,s3);
copyobj(fig4,s4);
copyobj(fig5,s5); 
copyobj(fig6,s6);
copyobj(fig7,s7);
copyobj(fig8,s8);
close(1:8)

end