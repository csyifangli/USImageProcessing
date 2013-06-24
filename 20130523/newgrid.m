function [stringrow,stringcolumn] = newgrid(defaultRow,defaultColumn,grid_length,numberPoints)
    
    img_width = 500;
    img_length = 500;
    
    gridsize = round(numberPoints.^2);
    vectorrow = zeros(1,5*gridsize);
    vectorcolumn = zeros(size(vectorrow));
    for k = 1:5
        positionGridX = defaultColumn(k);  %f(number,grid_length,radius_circle)
        positionGridY = defaultRow(k);  %f(number,grid_length,radius_circle)
        
        vectorcolumn(k*gridsize-(gridsize-1):k*gridsize) = repmat(positionGridX-grid_length*(numberPoints-1)/2:grid_length:positionGridX+grid_length*(numberPoints-1)/2,1,numberPoints);
        vectorrow(k*gridsize-(gridsize-1):k*gridsize) = reshape(repmat(positionGridY-grid_length*(numberPoints-1)/2:grid_length:positionGridY+grid_length*(numberPoints-1)/2,numberPoints,1),gridsize,1);        
    end

    
    stringrow = '';
    stringcolumn = '';
    for i = 1:numel(vectorrow)
        row_i = vectorrow(i);
        column_i = vectorcolumn(i);
        if row_i < 15
            row_i = 15;
        elseif row_i > img_length
            row_i = img_length;
        end
        
        if column_i < 15
            column_i = 15;
        elseif column_i > img_width
            column_i = img_width;
        end
        
        stringrow = strcat(stringrow,', ',num2str(row_i));
        stringcolumn = strcat(stringcolumn,', ',num2str(column_i));
    end

end