
%test=imread('testCases/test_saltAndPepper.png');
%imshow(test);

%getChars(test);
classdef getCharacters
        
    methods(Static)
        function getChars(preProcImg)

            chars=['A' 'a' 'B' 'b' 'C' 'c' 'D' 'd' 'E' 'e' 'F' 'f' 'G' 'g' 'H' 'I' 'i' 'J' 'j' 'K' 'k' 'L' 'l' 'M' 'm' 'N' 'n' 'O' 'o' 'P' 'p' 'Q' 'q' 'R' 'r' 'S' 's' 'T' 't' 'U' 'u' 'V' 'v' 'W' 'w' 'X' 'x' 'Y' 'y' 'Z' 'z'];
            ocrTest=ocr(preProcImg);
            readTest=ocrTest.Text;

            disp(readTest);

            for i=1:length(chars)
                disp(i);
                if contains(readTest,chars(i))
                    loc=locateText(ocrTest,chars(i));
                    sizeLoc=size(loc);
                    rows=sizeLoc(1);

                    x=loc(1);
                    y=loc(rows+1);
                    width=loc((rows*2)+1);
                    height=loc((rows*3)+1);
                    tempLoc=[x y width height];
                    disp(tempLoc);
                    %pImage=preProcImg{loc(1):loc(1)+loc(3),loc(2):loc(2)+loc(4)};

                    tempChar=imcrop(preProcImg,tempLoc);
                    figure();
                    imshow(tempChar);

                    if isstrprop(chars(i),'lower')
                        fileName=append('temp/',chars(i),'_l_match.png');
                        imwrite(tempChar,fileName);

                    else
                        fileName=append('temp/',chars(i),'_match.png');
                        imwrite(tempChar,fileName);

                    end



                end

            end

        end
    end
end