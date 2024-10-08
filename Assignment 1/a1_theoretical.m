%% Question 2

% 2.a
grey_level = [0:15]
pixels = [1, 9, 15, 45, 93, 50, 23, 12, 7, 1, 0,0,0,0,0,0]

figure('Name', 'histo');
bar(grey_level, pixels);
title('Histogram');
xlim([0, 15]);
% 2.b.i

n = sum(pixels)
rk = grey_level
nk = pixels

pr_rk = nk ./ n

figure('Name', 'pr_rk');
plot(rk, pr_rk);
title('pr(rk)')

sk = [0 1 4 10 12 14 15]
ps_sk = [0.00390625 0.09375 0.17578125 0.36328125 0.1953125 0.08984375 0.078125]

figure('Name', 'pr_rk');
plot(sk, ps_sk);
title('ps(sk)')

nk = [1 24 45 93 50 23 20]

figure('Name', 'histo equalized');
bar(sk, nk)
title('Histogram Equalized')
xlim([0, 15]);


