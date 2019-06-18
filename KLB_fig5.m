function KLB_fig5

figure;
subplot(3,1,1);
% 0 short fuse individuals
for prop=0:0.03:1 % proportion of hostile from 0 to 1 in steps of 0.03
    for simNum=1:10 % run simulation 10 times for each proportion
        rng('shuffle');
        % make a neighborhood 
        n = makeNeighborhood(6,6,0,prop);
        % evolve the neighborhood for 14 days
        for days = 2:14
            n = evolveNeighborhood(n);
        end
        finNumHostile = sum(sum(n(:,:,1)==1));
        finalPropHostile = finNumHostile/(numel(n)/2);
        scatter(prop,finalPropHostile,'filled','k');
        xlim([0:1]);
        ylim([0:1]);
        set(gca, 'YTick', 0:0.1:1);
        set(gca, 'XTick', 0:0.1:1);
        ylabel('Final Proportion Aggressive');
        text(0.75, 0.35, 'No Low Threshold Individuals');
        %title('No Low Threshold Individuals');
        hold on;
    end
end

subplot(3,1,2);
% 9 short fuse individuals
for prop=0:0.03:1
    for simNum=1:10
        rng('shuffle');
        % make a neighborhood 
        n = makeNeighborhood(6,6,9,prop);
        % evolve the neighborhood for 14 days
        for days = 2:14
            n = evolveNeighborhood(n);
        end
        finNumHostile = sum(sum(n(:,:,1)==1));
        finalPropHostile = finNumHostile/(numel(n)/2);
        scatter(prop,finalPropHostile,'filled','k');
        xlim([0:1]);
        ylim([0:1]);
        set(gca, 'YTick', 0:0.1:1);
        set(gca, 'XTick', 0:0.1:1);
        ylabel('Final Proportion Aggressive');
        text(0.75, 0.35, '9 Low Threshold Individuals');
        hold on;
    end
end

subplot(3,1,3);
% 18 short fuse individuals
for prop=0:0.03:1
    for simNum=1:10
        rng('shuffle');
        % make a neighborhood 
        n = makeNeighborhood(6,6,18,prop);
        % evolve the neighborhood for 14 days
        for days = 2:14
            n = evolveNeighborhood(n);
        end
        finNumHostile = sum(sum(n(:,:,1)==1));
        finalPropHostile = finNumHostile/(numel(n)/2);
        scatter(prop,finalPropHostile,'filled','k');
        xlim([0:1]);
        ylim([0:1]);
        set(gca, 'YTick', 0:0.1:1);
        set(gca, 'XTick', 0:0.1:1);
        ylabel('Final Proportion Aggressive');
        xlabel('Initial Proportion Aggressive');
        text(0.75, 0.35, '18 Low Threshold Individuals');
        hold on;
    end
end
end