clear

[num,txt,raw] = xlsread('코로나 확진율.xlsx'); % 파일 읽기

date_nv = num(:,1); % date
date_strnv = datenum(num2str(date_nv),'yyyymmdd'); % 형식에 맞게 변환

num_v = num(:,3); % date

%X = [1 2 3 6 7 8 9 10 13 14 15 16 17];
%Y = [55 57 60 71 78 72 90 101 126 136 150 164 176];

% Nan 무시하기
for i=1:size(num_v)
   if( isnan( num_v(i) ) )
   else
       break;
   end
end    

fprintf('시작 점 %d\n', i ); 

% X 값과 날짜 입력하기
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
xlabel('날짜 [년-월-일]'), ylabel('확진자 수')
datetick( 'x','yy-mm-dd')

