%In class 19

% Problem 1. Imagine a clincal trial for two drugs that are intended to lower
% cholesterol. Assume 30 subjects are randomly divided into 3 groups that
% either receive a placebo or one of the two treatments. The mean initials
% levels of total cholesterol in each group are the same. The final
% measurements look like

placebo = [   194   183   199   189   189   214   212   186   191   190];
treatment1 = [    138   217   188   126   249   217   255   196   279   123];
treatment2 =[   152   152   151   143   161   142   142   141   161   135];

%A. Make a bar plot of the means of each group with errorbars (Hint, use
%bar and then use 'hold on' and then errorbar). 

placebo_m = mean(placebo);
treatment1_m = mean(treatment1);
treatment2_m = mean(treatment2);
err_placebo = std(placebo);
err1 = std(treatment1);
err2 = std(treatment2);
x = {'placebo'; 'treatment1'; 'treatment2'};
y = [placebo_m treatment1_m treatment2_m];
err = [err_placebo err1 err2];
figure;
bar(y);
hold on;
errorbar(y, err);
xlabel('Groups', 'FontSize', 24);
ylabel('Levels of Total Cholesterol', 'FontSize', 24);
set(gca, 'xtick', [1:3], 'xticklabel', x);

%B. Run a one way ANOVA analysis to see whether any of the treatment groups showed
%a statistically signficant difference. 
%C. use the multcompare function to look at all pairs of samples and
%indicate which are significantly different. 

data = [placebo treatment1 treatment2];
groups = {'placebo','placebo','placebo','placebo','placebo','placebo',...
    'placebo','placebo','placebo','placebo','treatment1','treatment1',...
    'treatment1','treatment1','treatment1','treatment1','treatment1',...
    'treatment1','treatment1','treatment1','treatment2','treatment2',...
    'treatment2','treatment2','treatment2','treatment2','treatment2',...
    'treatment2','treatment2','treatment2'};
p = anova1(data, groups);

%Problem 2. In this directory, you will find a .mat file with three
%variables, xdat, ydat, and ydat2. For each pair (xdat, ydat) and (xdat,
%ydat2), fit the data to a first, second and third order polynomial. Which
%one is the best fit in each case? In at least one of the cases, do the
%problem with both the polyfit/polyval functions and with the 'fit' function.

%%
filename = 'data.mat';
load(filename);
% polyfit/polyval figure for xdat and ydat
figure;
subplot(2,2,1);
plot(xdat,ydat,'r.','MarkerSize',24);
subplot(2,2,2);
plot(xdat,ydat,'r.','MarkerSize',24);
[coeff1,s1] = polyfit(xdat,ydat,1);
hold on;
plot(xdat,polyval(coeff1, xdat),'k-','LineWidth', 3);
hold off;
subplot(2,2,3);
plot(xdat,ydat,'r.','MarkerSize',24);
[coeff2,s2] = polyfit(xdat,ydat,2);
hold on;
plot(xdat,polyval(coeff2, xdat),'k-','LineWidth', 3);
hold off;
subplot(2,2,4)
plot(xdat,ydat,'r.','MarkerSize',24);
[coeff3,s3] = polyfit(xdat,ydat,3);
hold on;
plot(xdat,polyval(coeff3, xdat),'k-','LineWidth', 3);
hold off;

% polyfit/polyval figure for xdat and ydat2
figure;
subplot(2,2,1);
plot(xdat,ydat2,'r.','MarkerSize',24);
subplot(2,2,2);
plot(xdat,ydat2,'r.','MarkerSize',24);
[coeff12,s12] = polyfit(xdat,ydat2,1);
hold on;
plot(xdat,polyval(coeff12, xdat),'k-','LineWidth', 3);
hold off;
subplot(2,2,3);
plot(xdat,ydat2,'r.','MarkerSize',24);
[coeff22,s22] = polyfit(xdat,ydat2,2);
hold on;
plot(xdat,polyval(coeff22, xdat),'k-','LineWidth', 3);
hold off;
subplot(2,2,4)
plot(xdat,ydat2,'r.','MarkerSize',24);
[coeff32,s32] = polyfit(xdat,ydat2,3);
hold on;
plot(xdat,polyval(coeff32, xdat),'k-','LineWidth', 3);
hold off;


% fit figure for xdat and ydat2
fit_lin = fit(xdat',ydat2','poly1');
fit_quad = fit(xdat',ydat2','poly2');
fit_cub = fit(xdat',ydat2','poly3');
figure; hold on;
plot(xdat, ydat2,'r.','MarkerSize',24);
plot(xdat, fit_lin(xdat), 'g-', 'LineWidth', 3);
plot(xdat, fit_quad(xdat), 'b-', 'LineWidth', 3);
plot(xdat, fit_cub(xdat), 'k-', 'LineWidth', 3);

% For xdat and ydat, the first order polynomial is enough to fit the
% figure. As the order of polynomial goes up, the fitness does not improve
% a lot, because xdat and ydat has a linear relationship. However, for xdat
% and ydat2, the third order polynomial works best, as it fits more data. 




