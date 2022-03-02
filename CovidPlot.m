clear

[num,txt,raw] = xlsread('�ڷγ� Ȯ����.xlsx'); % ���� �б�

date_nv = num(:,1); % date
date_strnv = datenum(num2str(date_nv),'yyyymmdd'); % ���Ŀ� �°� ��ȯ

num_v = num(:,3); % date

%X = [1 2 3 6 7 8 9 10 13 14 15 16 17];
%Y = [55 57 60 71 78 72 90 101 126 136 150 164 176];

% Nan �����ϱ�
for i=1:size(num_v)
   if( isnan( num_v(i) ) )
   else
       break;
   end
end    

fprintf('���� �� %d\n', i ); 

% X ���� ��¥ �Է��ϱ�
days = 1;
k = 1;
for j=i:size(num_v)
   if( isnan( num_v(j) ) )
   else
       X_V(k) = days;
       Y_V(k) = num_v(j);
       Date_V(k) = date_strnv(j);
       k = k + 1;
   end
   days = days + 1;
   % fprintf('%d\n', i ); 
end

p = polyfit( X_V, Y_V, 2 );

newX = 0:0.5:40;
f = polyval(p, newX);
figure;
plot( X_V+date_strnv(i), Y_V, 'o', newX+date_strnv(i), f )
grid on
grid minor
xlabel('��¥ [��-��-��]'), ylabel('Ȯ���� ��')
datetick( 'x','yy-mm-dd')

