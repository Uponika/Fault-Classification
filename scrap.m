a = who;
rows=1;
f = waitbar(0,'1','Name','Writing fault data to excel for...',...
    'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
setappdata(f,'canceling',0);

% set(f,'interpreter', 'none');
for i = 1:1:109
    label = a(i);
    %for rows = 1:100:(100*i+1)
        waitbar(i/107,f,[cell2mat(label)]);
        labelData = evalin('base',cell2mat(label));
        %labelData =  labelData((201:end), :)
        xlswrite('faultData_correct5.xls', labelData((201:end), :),1,['A' num2str(rows) ': H' num2str(rows+100)]);
        xlswrite('faultData_correct5.xls', label,1,['I' num2str(rows) ': I' num2str(rows+100)])
        rows=rows+101;
         
    %end
end
xlswrite('faultData_correct5.xls', CG_90 ,1, 'A11010:H11310')
delete(f);