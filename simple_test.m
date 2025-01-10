% This program is a simple test for the MAPR estimation performance.

% Setting the parameters
a = sqrt(2);              % Amplitude
phi = 1.5;                % Phase
SNR_dB = 20;              % SNR (dB)
N = 200;                  % Observation length
omega0 = 0.4;             % Actual frequency

% Calculate the standard deviation (sigma)
SNR = 10^(SNR_dB / 10);
sigma = a / sqrt(2 * SNR); 

% Generate the noisy version of the signal
n = 1:N;
cosine_signal = a * cos(omega0 * n + phi);
noise = sigma * randn(1, N);
x = cosine_signal + noise;
        
% Start timer for MAPR estimation
tic;

% Frequency estimate using the MAPR method
frequency_estimate = MAPR(x, N, all_coefficients);

% Stop timer and get the elapsed time
elapsed_time = toc;

% Calculate the absolute error between our estimate and the actual frequency
error = abs(omega0 - frequency_estimate);

% Print the results of performance
fprintf('Actual frequency: %.4f\n', omega0);
fprintf('Frequency estimate of MAPR algorithm: %.4f\n', frequency_estimate);
fprintf('Absolute error: %.4f\n', error);
fprintf('MAPR algorithm run time: %.6f seconds\n', elapsed_time);
       