% implementation of (n,k,m) = (2,1,3) convolutional code
 clear all; close all; clc;

 for i = 1:200

    bitVecLen = 12;      %randi(50) + 50;

    msg = randi(2, [1, bitVecLen]) - 1;
    
    encoded = convencode(msg);

    encoded_noisy = encoded;

    encoded_noisy(end) = ~encoded(end); %flipping first bit

    encoded_noisy(1) = ~encoded_noisy(1); %flipping last bit

    encoded_noisy(end-1) = ~encoded_noisy(end-1); %flipping last before bit

%    encoded_noisy(end-2) = ~encoded_noisy(end-2); %flipping last before before bit
% 
%     encoded_noisy(end-3) = ~encoded_noisy(end-3);
% 
%     encoded_noisy(end-4) = ~encoded_noisy(end-4);
% 
%     encoded_noisy(end-5) = ~encoded_noisy(end-5);
% 
%     encoded_noisy(end-6) = ~encoded_noisy(end-6);

    [tr, decoded] = convdecode(encoded_noisy);
    

    if length(decoded) == length(msg)
        sum( decoded~= msg )
    else
        sum( decoded(1:length(msg)) ~= msg )
    end

 end