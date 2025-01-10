% The MAPR estimator.
function omega_MAPR = MAPR(x, N, all_coefficients)
    
    % Calculate r1 and r2
    r1 = x(3:N-2) * (x(4:N-1) + x(2:N-3))';
    r2 = x(3:N-2) * (x(5:N) + x(1:N-4))';
    
    % Calculate the cosine of the coarse estimate: \cos(\hat{\omega}_0^m)
    cosine_coarse_estimate = (r2 + sqrt(r2^2 + 8 * r1^2)) / (4 * r1);
    
    % Ensure the argument in the arccosine function is between -1 and 1
    cosine_coarse_estimate = min(max(cosine_coarse_estimate, -1), 1);
    
    % Calculate the coarse estimate: \hat{\omega}_0^m
    coarse_estimate = acos(cosine_coarse_estimate);
    
    % Using the coarse estimate to find the optimal lag, denoted by k^*
    kmax = floor((N - 1) / 2); % Maximum lag
    values = zeros(1, kmax - 1);
    
    for k = 2:kmax % Corresponding to (28) in our paper. The index is from 1 to (kmax - 1)
        values(k - 1) = M(coarse_estimate, k) / ((N - 2 * k)^2 * I(coarse_estimate, k)^2);
    end
    
    [~, k_star] = min(values); 
    % Index plus 1 is the optimal k
    k_star = k_star + 1; % The optimal lag (k_star)
    
    % Using the optimal k to calculate r_{k^*-1} and r_{k^*}
    r_k_star_minus_1 = x(k_star + 1:N - k_star) * (x(2*k_star:N - 1) + x(2:N - 2*k_star + 1))';
    r_k_star = x(k_star + 1:N - k_star) * (x(2*k_star + 1:N) + x(1:N - 2*k_star))';
    
    % Employ the coefficients corresponding to the optimal k
    coefficients = all_coefficients{k_star}; % all_coefficients precomputed in "precompute_Chebyshev"
    
    % Multiply the odd and even terms by r_{k^* - 1} and r_{k^*}, respectively
    coefficients(1:2:end) = coefficients(1:2:end) * r_k_star_minus_1;
    coefficients(2:2:end) = coefficients(2:2:end) * r_k_star;
    
    % Polynomial root-finding
    A = diag(ones(k_star - 1, 1), -1); 
    A(1, :) = -coefficients(2:k_star + 1) ./ coefficients(1); % Companion matrix
    all_roots = eig(A); % Compute the eigenvalues of the companion matrix as the roots
    
    % Using the cosine of the coarse estimate to determine the root corresponding to the actual frequency
    [~, i_star] = min(abs(all_roots - cosine_coarse_estimate));
    corresponding_root = all_roots(i_star);
    
    % Ensure the argument in the arccosine function is between -1 and 1
    corresponding_root = min(max(corresponding_root, -1), 1);
    
    % Final estimate
    omega_MAPR = acos(corresponding_root);
end
