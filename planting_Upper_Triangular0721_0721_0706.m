clc;
normWo.signals.values = sqrt(sum(W_eo.signals.values.^2, 2));
normW.signals.values = sqrt(sum(W_e.signals.values.^2, 2));

AE1_O = sqrt(sum(((x1_o.signals.values - yr.signals.values)).^2));
AE2_O = sqrt(sum(((x1_eo.signals.values - x1_o.signals.values)).^2));
TAE1_O = sqrt(sum((x1_o.time).*((x1_o.signals.values - yr.signals.values)).^2));
TAE2_O = sqrt(sum((x1_o.time).*((x1_eo.signals.values - x1_o.signals.values)).^2));
RME1_O = sqrt(sum(((x1_o.signals.values - yr.signals.values)).^2)/(size(x1_o.signals.values,1)));
RME2_O = sqrt(sum(((x1_eo.signals.values - x1_o.signals.values)).^2)/(size(x1_o.signals.values,1)));
MAD1_O = max(abs(x1_o.signals.values - yr.signals.values));
MAD2_O = max(abs(x1_eo.signals.values - x1_o.signals.values));
Data_O = [AE1_O;AE2_O;TAE1_O;TAE2_O;RME1_O;RME2_O;MAD1_O;MAD2_O];

AE1 = sqrt(sum(((x1.signals.values - yr.signals.values)).^2));
AE2 = sqrt(sum(((x1_e.signals.values - x1.signals.values)).^2));
TAE1 = sqrt(sum((x1.time).*((x1.signals.values - yr.signals.values)).^2));
TAE2 = sqrt(sum((x1.time).*((x1_e.signals.values - x1.signals.values)).^2));
RME1 = sqrt(sum(((x1.signals.values - yr.signals.values)).^2)/(size(x1.signals.values,1)));
RME2 = sqrt(sum(((x1_e.signals.values - x1.signals.values)).^2)/(size(x1.signals.values,1)));
MAD1 = max(abs(x1.signals.values - yr.signals.values));
MAD2 = max(abs(x1_e.signals.values - x1.signals.values));
Data = [AE1;AE2;TAE1;TAE2;RME1;RME2;MAD1;MAD2];

Commplate = [Data_O,Data,(Data-Data_O)./Data];
F1a = figure(1);set(0, 'DefaultAxesFontSize', 23);
plot(uo.time,uo.signals.values(:,1),'r-','LineWidth', 3.5); hold on;
plot(u.time,u.signals.values(:,1),'b:','LineWidth', 3.5); hold on;
xlim([0,100]);%pbaspect([3 2 1]);
ylabel('The control output','Interpreter', 'latex', 'FontSize', 23);xlabel('Time(s)', 'FontSize', 23); 
legend({'$u(t)$ with optimizer';'$u(t)$ without optimizer'},'Interpreter', 'latex', 'FontSize', 23, 'Orientation', 'vertical','Location', 'southeast');

F4 = figure(7);set(0, 'DefaultAxesFontSize', 23);

plot(x1_o.time,x1_o.signals.values(:,1),'r-','LineWidth', 3.5); hold on;
plot(x1.time,x1.signals.values(:,1),'b--','LineWidth', 3.5); hold on;
plot(yr.time,yr.signals.values(:,1),'k:','LineWidth', 3.5); hold on;
xlim([0,100]);ylim([-30,25]);%pbaspect([16 9 1]);
ylabel('The output of system','Interpreter', 'latex', 'FontSize', 23);xlabel('Time(s)', 'FontSize', 23);
legend({'${y(t)}$ with optimizer','${y(t)}$ without optimizer','${y_r(t)}$'},'Interpreter', 'latex', 'FontSize', 23, 'Orientation', 'vertical','Location', 'northeast');

F5 = figure(10);set(0, 'DefaultAxesFontSize', 23);
plot(x1_o.time,x1_o.signals.values(:,1)-yr.signals.values(:,1),'r-','LineWidth', 3.5); hold on;
plot(x1.time,x1.signals.values(:,1)-yr.signals.values(:,1),'b:','LineWidth', 3.5); hold on;
xlim([0,100]);%pbaspect([16 6 1]);
ylim([-30,40]);
ylabel('The tracking error of system','Interpreter', 'latex', 'FontSize', 23);xlabel('Time(s)', 'FontSize', 23);
legend({'${y(t)}-{y_r(t)}$ with optimizer','${y(t)}-{y_r(t)}$ without optimizer'},'Interpreter', 'latex', 'FontSize', 23, 'Orientation', 'vertical','Location', 'southeast');

F6 = figure(11);set(0, 'DefaultAxesFontSize', 23);
plot(x1_o.time,x1_eo.signals.values(:,1) - x1_o.signals.values(:,1),'r-','LineWidth', 3.5); hold on;
plot(x2_o.time,x2_eo.signals.values(:,1) - x2_o.signals.values(:,1),'r:','LineWidth', 3.5); hold on;
plot(x3_o.time,x3_eo.signals.values(:,1) - x3_o.signals.values(:,1),'r--','LineWidth', 3.5); hold on;
plot(x1.time,x1_e.signals.values(:,1) - x1.signals.values(:,1),'b-','LineWidth', 3.5); hold on;
plot(x2.time,x2_e.signals.values(:,1) - x2.signals.values(:,1),'b:','LineWidth', 3.5); hold on;
plot(x3.time,x2_e.signals.values(:,1) - x2.signals.values(:,1),'b--','LineWidth', 3.5); hold on;
xlim([0,100]);ylim([-40,30]);%pbaspect([16 9 1]);
ylabel({'The states of system'},'Interpreter', 'latex', 'FontSize', 23);xlabel('Time(s)', 'FontSize', 23);
legend({'${\hat{x}_1(t)}-{x_1(t)}$ with optimizer','${\hat{x}_2(t)}-{x_2(t)}$ with optimizer','${\hat{x}_3(t)}-{x_3(t)}$ with optimizer','${\hat{x}_1(t)}-{x_1(t)}$','${\hat{x}_2(t)}-{x_2(t)}$','${\hat{x}_3(t)}-{x_3(t)}$'},'Interpreter', 'latex', 'FontSize', 23, 'Orientation', 'vertical','Location', 'southeast');

F8 = figure(27);set(0, 'DefaultAxesFontSize', 23);
plot(c2.time,c2.signals.values(:,1),'r-','LineWidth', 3.5); hold on;
plot(c1.time,c1.signals.values(:,1),'b:','LineWidth', 3.5); hold on;
xlim([0,150]);
%ylim([-1.5,0.6]);%pbaspect([16 9 1]);
ylabel({'The outputs of optimizer'},'Interpreter', 'latex', 'FontSize', 23);xlabel('Time(s)', 'FontSize', 23);
legend({'$c_1(t)$','$c_2(t)$'},'Interpreter', 'latex', 'FontSize', 23, 'Orientation', 'vertical');

F9 = figure(23);set(0, 'DefaultAxesFontSize', 23);
plot(J.time,J.signals.values(:,1),'r-','LineWidth', 3.5); hold on;
xlim([0,100]);
ylim([-5,30]);%pbaspect([16 9 1]);
ylabel({'Objective Function'},'Interpreter', 'latex', 'FontSize', 23);xlabel('Time(s)', 'FontSize', 23);

F11 = figure(29);set(0, 'DefaultAxesFontSize', 23);
plot(W_eo.time,normWo.signals.values(:,1),'r-','LineWidth', 3.5); hold on;
%plot(W_e.time,normW.signals.values(:,1),'b:','LineWidth', 3.5); hold on;
xlim([0,100]);
ylim([-0.1,0.5]);%pbaspect([16 9 1]);
ylabel({'The adaptive law'},'Interpreter', 'latex', 'FontSize', 23);xlabel('Time(s)', 'FontSize', 23);
legend({'${{\left\| {{{\mathbf{\hat{W}}}}} \right\|}} $ with optimizer','${{\left\| {{{\mathbf{\hat{W}}}}} \right\|}}$ without optimizer'},'Interpreter', 'latex', 'FontSize', 23, 'Orientation', 'vertical');

F12 = figure(30);set(0, 'DefaultAxesFontSize', 23);
categories = {'AE$(y-y_r)$', 'AE$(\hat{y}-y)$'}; % 修改为LaTeX格式
boxA_data = [AE1_O,AE2_O];boxB_data = [AE1,AE2];
set(gca,'FontSize', 23);bar_width = 0.6;
h = bar([boxA_data; boxB_data]', bar_width, 'grouped');
hold on;
h(1).FaceColor = [0.9, 0.2, 0.2];h(2).FaceColor = [0.2, 0.2, 0.8];
ylim([0,900]);
for i = 1:length(categories)
    text(i-0.15, boxA_data(i)+0.05, sprintf('%.4f', boxA_data(i)),...
        'FontSize', 23, 'HorizontalAlignment', 'center');
    text(i+0.15, boxB_data(i)+0.05, sprintf('%.4f', boxB_data(i)),...
        'FontSize', 23, 'HorizontalAlignment', 'center');
end
set(gca, 'XTick', 1:2, 'XTickLabel', categories, 'TickLabelInterpreter', 'latex'); % 添加解释器
grid on;%set(gca, 'GridAlpha', 0.2);
set(gca, 'YGrid','off');set(gca, 'XGrid','off');
legend({'With optimizer', 'Without optimizer'}, 'Location', 'northeast', 'FontSize', 23);
box on;
hold off;

F13 = figure(31);set(0, 'DefaultAxesFontSize', 23);
categories = {'TAE$(y-y_r)$', 'TAE$(\hat{y}-y)$'}; % 修正了第一个标签缺少$的问题
boxA_data = [TAE1_O,TAE2_O];boxB_data = [TAE1,TAE2];
set(gca,'FontSize', 23);bar_width = 0.6;
h = bar([boxA_data; boxB_data]', bar_width, 'grouped');
hold on;
h(1).FaceColor = [0.9, 0.2, 0.2];h(2).FaceColor = [0.2, 0.2, 0.8];
ylim([0,2500]);
for i = 1:length(categories)
    text(i-0.15, boxA_data(i)+0.05, sprintf('%.4f', boxA_data(i)),...
        'FontSize', 23, 'HorizontalAlignment', 'center');
    text(i+0.15, boxB_data(i)+0.05, sprintf('%.4f', boxB_data(i)),...
        'FontSize', 23, 'HorizontalAlignment', 'center');
end
set(gca, 'XTick', 1:2, 'XTickLabel', categories, 'TickLabelInterpreter', 'latex'); % 添加解释器
grid on;%set(gca, 'GridAlpha', 0.2);
set(gca, 'YGrid','off');set(gca, 'XGrid','off');
legend({'With optimizer', 'Without optimizer'}, 'Location', 'northeast', 'FontSize', 23);
box on;
hold off;

F14 = figure(32);set(0, 'DefaultAxesFontSize', 23);
categories = {'RMSE$(y-y_r)$', 'RMSE$(\hat{y}-y)$'}; % 修改为LaTeX格式
boxA_data = [RME1_O,RME2_O];boxB_data = [RME1,RME2];
set(gca,'FontSize', 23);bar_width = 0.6;
h = bar([boxA_data; boxB_data]', bar_width, 'grouped');
hold on;
h(1).FaceColor = [0.9, 0.2, 0.2];h(2).FaceColor = [0.2, 0.2, 0.8];
ylim([0,6]);
for i = 1:length(categories)
    text(i-0.15, boxA_data(i)+0.05, sprintf('%.4f', boxA_data(i)),...
        'FontSize', 23, 'HorizontalAlignment', 'center');
    text(i+0.15, boxB_data(i)+0.05, sprintf('%.4f', boxB_data(i)),...
        'FontSize', 23, 'HorizontalAlignment', 'center');
end
set(gca, 'XTick', 1:2, 'XTickLabel', categories, 'TickLabelInterpreter', 'latex'); % 添加解释器
grid on;%set(gca, 'GridAlpha', 0.2);
set(gca, 'YGrid','off');set(gca, 'XGrid','off');
legend({'With optimizer', 'Without optimizer'}, 'Location', 'northeast', 'FontSize', 23);
box on;
hold off;

F15 = figure(33);set(0, 'DefaultAxesFontSize', 23);
categories = {'MAD$(y-y_r)$', 'MAD$(\hat{y}-y)$'}; % 修改为LaTeX格式
boxA_data = [MAD1_O,MAD2_O];boxB_data = [MAD1,MAD2];
set(gca,'FontSize', 23);bar_width = 0.6;
h = bar([boxA_data; boxB_data]', bar_width, 'grouped');
hold on;
h(1).FaceColor = [0.9, 0.2, 0.2];h(2).FaceColor = [0.2, 0.2, 0.8];
ylim([0,30]);
for i = 1:length(categories)
    text(i-0.15, boxA_data(i)+0.05, sprintf('%.4f', boxA_data(i)),...
        'FontSize', 23, 'HorizontalAlignment', 'center');
    text(i+0.15, boxB_data(i)+0.05, sprintf('%.4f', boxB_data(i)),...
        'FontSize', 23, 'HorizontalAlignment', 'center');
end
set(gca, 'XTick', 1:2, 'XTickLabel', categories, 'TickLabelInterpreter', 'latex'); % 添加解释器
grid on;%set(gca, 'GridAlpha', 0.2);
set(gca, 'YGrid','off');set(gca, 'XGrid','off');
legend({'With optimizer', 'Without optimizer'}, 'Location', 'northeast', 'FontSize', 23);
box on;
hold off;


saveas(F1a,'D:\MATLAB\QiuJiongzhi\DGTOC_Uper_0720\Figure\u.fig');
saveas(F4,'D:\MATLAB\QiuJiongzhi\DGTOC_Uper_0720\Figure\y.fig');
saveas(F5,'D:\MATLAB\QiuJiongzhi\DGTOC_Uper_0720\Figure\ye.fig');
saveas(F6,'D:\MATLAB\QiuJiongzhi\DGTOC_Uper_0720\Figure\ex.fig');
saveas(F8,'D:\MATLAB\QiuJiongzhi\DGTOC_Uper_0720\Figure\p.fig');
saveas(F9,'D:\MATLAB\QiuJiongzhi\DGTOC_Uper_0720\Figure\J.fig');
saveas(F11,'D:\MATLAB\QiuJiongzhi\DGTOC_Uper_0720\Figure\W.fig');
saveas(F12,'D:\MATLAB\QiuJiongzhi\DGTOC_Uper_0720\Figure\RE.fig');
saveas(F13,'D:\MATLAB\QiuJiongzhi\DGTOC_Uper_0720\Figure\TRE.fig');
saveas(F14,'D:\MATLAB\QiuJiongzhi\DGTOC_Uper_0720\Figure\RMSE.fig');
saveas(F15,'D:\MATLAB\QiuJiongzhi\DGTOC_Uper_0720\Figure\MAD.fig');

saveas(F1a,'D:\MATLAB\QiuJiongzhi\DGTOC_Uper_0720\Figure\u.pdf');
saveas(F4,'D:\MATLAB\QiuJiongzhi\DGTOC_Uper_0720\Figure\y.pdf');
saveas(F5,'D:\MATLAB\QiuJiongzhi\DGTOC_Uper_0720\Figure\ye.pdf');
saveas(F6,'D:\MATLAB\QiuJiongzhi\DGTOC_Uper_0720\Figure\ex.pdf');
saveas(F8,'D:\MATLAB\QiuJiongzhi\DGTOC_Uper_0720\Figure\p.pdf');
saveas(F9,'D:\MATLAB\QiuJiongzhi\DGTOC_Uper_0720\Figure\J.pdf');
saveas(F11,'D:\MATLAB\QiuJiongzhi\DGTOC_Uper_0720\Figure\W.pdf');
saveas(F12,'D:\MATLAB\QiuJiongzhi\DGTOC_Uper_0720\Figure\RE.pdf');
saveas(F13,'D:\MATLAB\QiuJiongzhi\DGTOC_Uper_0720\Figure\TRE.pdf');
saveas(F14,'D:\MATLAB\QiuJiongzhi\DGTOC_Uper_0720\Figure\RMSE.pdf');
saveas(F15,'D:\MATLAB\QiuJiongzhi\DGTOC_Uper_0720\Figure\MAD.pdf');
close all;