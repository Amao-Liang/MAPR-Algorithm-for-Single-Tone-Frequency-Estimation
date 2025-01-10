% This function is given in Appendix of our paper.
function result = I(omega0,k)
     % Calculate the result based on omega_0 and k
     result = (k - 0.5) * sin(omega0) + 0.5 * sin((2 * k - 1) * omega0);
end
