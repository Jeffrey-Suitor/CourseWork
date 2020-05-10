clc; clear; close all;
stock = get_yahoo_stockdata3('msft', '1-Jan-2018');

duration = length(stock.DateTime) - 200;
moving_avg = zeros(1, duration);
linear = zeros(1, duration);
quadratic = zeros(1, duration);
cubic = zeros(1, duration);

cur_vals = zeros(1,200);
day_count = zeros(1,200);

for i=1:length(stock.DateTime)
    if i <= 200
        cur_vals(i) = stock.closePrice(i);
        day_count(i) = i;
        
    else

        lin_p = polyfit(day_count, cur_vals, 1);
        quad_p = polyfit(day_count, cur_vals, 2);
        cube_p = polyfit(day_count, cur_vals, 3);
        
        linear(i-200) = polyval(lin_p, i);
        quadratic(i-200) = polyval(quad_p, i);
        cubic(i-200) = polyval(cube_p, i);
        
        cur_vals = cat(2, cur_vals(2:end), stock.closePrice(i));
        day_vals = cat(2, day_count(2:end), i);
        moving_avg(i-200) = sum(cur_vals)/200;
        
    end
end

days = datetime(stock.DateTime(201:end),'ConvertFrom','datenum');

hold on
figure(1)
plot(days, moving_avg)
title("200 Day Moving Average")
xlabel("Days")
ylabel("Stock Value ($)")

figure(2)
plot(days, linear)
title("Linear 200 Prediction")
xlabel("Days")
ylabel("Stock Value ($)")

figure(3)
plot(days, quadratic)
title("Quadratic 200 Prediction")
xlabel("Days")
ylabel("Stock Value ($)")

figure(4)
plot(days, cubic)
title("Cubic 200 Prediction")
xlabel("Days")
ylabel("Stock Value ($)")

hold off