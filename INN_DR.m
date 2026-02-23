%% Dimensionality Reduction Workshop Sample Code

% This code is for visualizing and running singular value decomposition
% (SVD) and principal components analysis (PCA) following the
% Dimensionality Reduction workshop at SFU in October, 2025. 

% Files prepared by Sarah Faber

%% 1. Running an SVD:

indata = your_data;
[u,s,v] = svd(indata);

%% Look at it!
% This syntax combines the output from the SVD into a single plot:

figure
subplot(1,3,1)
plot(diag(s),'LineWidth',1.5)
grid on
title('Skree plot: SVD','FontSize',14)
ylabel('Singular Values')
xlabel('Component')
set(gca,'FontSize',14)

subplot(1,3,2)
imagesc(v)
grid on
colorbar
title('Component Scores: Columns','FontSize',14)
yticklabels(your_labels)% put your own labels here
ylabel('Y Axis')
xlabel('Component')
set(gca,'FontSize',14)

subplot(1,3,3)
imagesc(u)
grid on
colorbar
title('Component Scores: Rows','FontSize',14)
ylabel('Y Axis')
yticklabels(your_labels)% put your own labels here
xlabel('Component')
set(gca,'FontSize',14)
set(gcf,'Color','w')

%% 2. Running a PCA
indata = your_data;

[coeff,score,latent] = pca(indata);% if the results look wonky, transpose your data (indata')


%% Look at it!

figure
subplot(1,2,1)
plot(latent,'LineWidth',1.5)
grid on
title('Skree plot: PCA','FontSize',14)
ylabel('% Variance Explained')
xlabel('Component')
set(gca,'FontSize',14)

subplot(1,2,2)
imagesc(coeff)
grid on
colorbar
title('Component Scores','FontSize',14)
ylabel('Y Axis')
yticklabels(your_labels)% add your labels in here
xlabel('Component')
set(gca,'FontSize',14)
set(gcf,'Color','w')
