% This programme precomputes the coefficients of Chebyshev polynomials to reduce computational costs.

% In this programme, cos(omega) to cos(200 * omega) are expanded into 
% polynomials relating to only cos(omega). You can adjust the expansion number.
expand_num = 200; 
expanded_polynomial = cell(1, expand_num);  % Cell array to store expanded polynomials
syms y;  % Define symbolic variable

% Recursive expansion to generate Chebyshev polynomials
for m = 1:expand_num
    expanded_polynomial{m} = chebyshevT(m, y);  % Store each Chebyshev polynomial
end

% Using the expanded polynomials to construct combined polynomials:
% cos((k-1) * omega) - cos(k * omega).
% Extract the coefficients of all combined polynomials for later use in the MAPR algorithm.
all_coefficients = cell(1, expand_num);  % Cell array to store the coefficients
for l = 2:expand_num
    % Construct the combined polynomial: cos((k-1)*omega) - cos(k*omega)
    combined_polynomial = expanded_polynomial{l-1} - expanded_polynomial{l};
    
    % Extract the coefficients of the polynomial (reverse the order)
    all_coefficients{l} = double(fliplr(coeffs(combined_polynomial)));
end
