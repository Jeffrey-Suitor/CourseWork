data = load('EEGdata_assignment3.mat');

eeg1 = data.EEG1;
eeg2 = data.EEG2;
signals = {eeg1, eeg2};

fs = data.Fs;

for signal=1:length(signals)
    [Mx, phx, f] = fourier_dt(signals{signal}, fs, "full");
    plot(f,Mx)
    title_string = strcat('Magnitude of EEG', num2str(signal));
    title(title_string)
    waitforbuttonpress;
    
    % Get the different waveforms
    delta = find(f>=0 & f<3);
    theta = find(f>=3 & f<8);
    alpha = find(f>=8 & f<13);
    beta = find(f>=13 & f<25);
    gamma = find(f>=25 & f<=100);
    waves = {delta, theta, alpha, beta, gamma};
    wave_names = {"delta", "theta", "alpha", "beta", "gamma"};
    
    for wave=1:length(waves)
        p = signals{signal}.^2 / fs;
        plot(f(waves{wave}), p(waves{wave}));
        title_string = strcat("EEG", num2str(signal), " -> Waveform: ", wave_names{wave});
        title(title_string)
        waitforbuttonpress;
        band = waves{wave};
        size = length(band);
        total_power = sum(p(band));
        avg_power = total_power / size;
        disp(strcat(title_string, "-> Average Power: ", num2str(avg_power)));
    end
    disp(" ")
end
