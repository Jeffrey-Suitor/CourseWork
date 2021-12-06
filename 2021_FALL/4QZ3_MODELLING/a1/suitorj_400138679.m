clc

data = readtable("Q1.txt", 'VariableNamingRule', 'preserve');
model = fitlm(data(:, 2:end));
estimates = model.Coefficients.Estimate
anova(model)

figure(1)
plotResiduals(model, 'fitted')

figure(2)
plot(model)
