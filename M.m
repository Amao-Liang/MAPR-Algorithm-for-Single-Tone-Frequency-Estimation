% This function is given in the Appendix of our paper.
function result = M(omega0, k)
    % Calculate the result based on omega_0 and k
    result = (1 - k) * cos(2 * omega0) + cos((2 * k - 2) * omega0) + k;
end
