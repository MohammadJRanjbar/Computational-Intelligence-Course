function O = Gaussian( x, mu, sig )
O=exp(-power(x-mu,2))/(2*power(sig,2));
end

