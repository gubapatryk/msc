%Sjl = sparse(readmatrix('output_matrixS.txt'))
%Tjl = sparse(readmatrix('output_matrixT.txt'))

nonzero_count = nnz(Tjl);
tic
[eigVtr_int, eigVal] = eigs(Sjl, Tjl, 9, 20000,'Tolerance',1e-14, 'Display', 1);
toc

eigVal = diag(eigVal); % j*w/c0
[eigTmp, eigIdx_sort] = sort(real(-1i*eigVal));
eigVal     = -1i*eigVal(eigIdx_sort); % w/c0
eigVtr_int = eigVtr_int(:,eigIdx_sort);
fr = c0*eigVal/(2*pi);

% Visualize the eigenfrequencies
figure(1), clf
plot(real(fr)/1e9, imag(fr)/1e9, 'ks')
xlabel('Real part of eigenfrequency [GHz]')
ylabel('Imaginary part of eigenfrequency [GHz]')
grid on