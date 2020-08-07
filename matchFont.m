
classdef matchFont

    methods(Static)
        function fonts=findMatchFont()

            charsDir=dir('temp/*.png');

            %disp(length(charsDir));

            match=[0 0 0 0 0 0];

            for i=1:length(charsDir)

                fileName=charsDir(i).name;
                %disp(fileName);

                charVal=fileName(1);
                
                
                full=append('temp/',fileName);
                img=imread(full);
                match(1)=match(1)+checkCooper(img,charVal);
                match(2)=match(2)+checkCourier(img,charVal);
                match(3)=match(3)+checkHelvetica(img,charVal);
                match(4)=match(4)+checkRoboto(img,charVal);
                match(5)=match(5)+checkSaltAndPepper(img,charVal);
                match(6)=match(6)+checkTimesNewRoman(img,charVal);

                delete(full);

            end
            match=match/length(charsDir);
            
            
            fonts=[0 0 0 0 0 0];
            
            for i=1:3
                
                best=max(match);
                disp(best);

                locBest=find(match==best);
                disp(locBest);
                
                switch (locBest)
                    case 1
                        font='Cooper Black';
                    case 2
                        font='Courier';
                    case 3
                        font='Helvetica';
                    case 4
                        font ='Roboto';
                    case 5
                        font='Salt & Pepper';
                    case 6
                        font='Times New Roman';
                end
                
                nameInd=i*2;
                matchInd=(i*2)+1;
                fonts(nameInd)=font;
                fonts(matchInd)=best;
                
                match(locBest)=-1;
               
            end


        end


        function percMatch=checkCooper(img,charCheck)

            %
            %matchImg=rgb2gray(matchImg);
            ex=imread('Fonts/Cooper Black/example.png');
            test=ocr(ex);
            
            disp(charCheck);
            charfind=locateText(test,charCheck);


            numChars=size(charfind);
            if numChars(1)~=1
                matchImgPath=append('Fonts/Cooper Black/',charCheck,'.png');
                matchImg=imread(matchImgPath);

            else
                crop=imcrop(ex,charfind);

                matchImg=imresize(crop,[40 40]);


            end

            matchImg=rgb2gray(matchImg);

            %disp(size(img));
            %disp(size(matchImg));

            %rough match
            tempImg=imresize(img,[40 40]);
            tempImg=rgb2gray(tempImg);

            diffImg=matchImg-tempImg;
            %imshow(diffImg);

            nonMatch=0;

            for i=1:40
                for j=1:40
                    if diffImg(i,j)~=0
                        nonMatch=nonMatch+1;
                    end

                end
            end

            percMatch=1-(nonMatch/(40*40));
            disp(percMatch);

        end
        function percMatch=checkCourier(img,char)

            %matchImgPath=append('Fonts/Courier/',char,'.png');
            %matchImg=imread(matchImgPath);
            %matchImg=rgb2gray(matchImg);

            ex=imread('Fonts/Courier/example.png');
            test=ocr(ex);

            charfind=locateText(test,char);
            numChars=size(charfind);
            if numChars(1)~=1
                matchImgPath=append('Fonts/Courier/',char,'.png');
                matchImg=imread(matchImgPath);

            else
                crop=imcrop(ex,charfind);

                matchImg=imresize(crop,[40 40]);


            end

            matchImg=rgb2gray(matchImg);
            %disp(size(img));
            %disp(size(matchImg));

            %rough match
            tempImg=imresize(img,[40 40]);
            tempImg=rgb2gray(tempImg);

            diffImg=matchImg-tempImg;
            %imshow(diffImg);

            nonMatch=0;

            for i=1:40
                for j=1:40
                    if diffImg(i,j)~=0
                        nonMatch=nonMatch+1;
                    end

                end
            end

            percMatch=1-(nonMatch/(40*40));
            disp(percMatch);

        end
        function percMatch=checkHelvetica(img,char)

           % matchImgPath=append('Fonts/Helvetica/',char,'.png');
            %matchImg=imread(matchImgPath);
            %matchImg=rgb2gray(matchImg);
            ex=imread('Fonts/Helvetica/example.png');
            test=ocr(ex);

            charfind=locateText(test,char);
            numChars=size(charfind);
            if numChars(1)~=1
                matchImgPath=append('Fonts/Helvetica/',char,'.png');
                matchImg=imread(matchImgPath);

            else
                crop=imcrop(ex,charfind);

                matchImg=imresize(crop,[40 40]);


            end

            matchImg=rgb2gray(matchImg);
            %disp(size(img));
            %disp(size(matchImg));

            %rough match
            tempImg=imresize(img,[40 40]);
            tempImg=rgb2gray(tempImg);

            diffImg=matchImg-tempImg;
            %imshow(diffImg);

            nonMatch=0;

            for i=1:40
                for j=1:40
                    if diffImg(i,j)~=0
                        nonMatch=nonMatch+1;
                    end

                end
            end

            percMatch=1-(nonMatch/(40*40));
            disp(percMatch);

        end
        function percMatch=checkRoboto(img,char)

            %matchImgPath=append('Fonts/Roboto/',char,'.png');
            %matchImg=imread(matchImgPath);
            %matchImg=rgb2gray(matchImg);

            ex=imread('Fonts/Roboto/example.png');
            test=ocr(ex);

            charfind=locateText(test,char);
            numChars=size(charfind);
            if numChars(1)~=1
                matchImgPath=append('Fonts/Roboto/',char,'.png');
                matchImg=imread(matchImgPath);

            else
                crop=imcrop(ex,charfind);

                matchImg=imresize(crop,[40 40]);


            end

            matchImg=rgb2gray(matchImg);

            %disp(size(img));
            %disp(size(matchImg));

            %rough match
            tempImg=imresize(img,[40 40]);
            tempImg=rgb2gray(tempImg);

            diffImg=matchImg-tempImg;
            %imshow(diffImg);

            nonMatch=0;

            for i=1:40
                for j=1:40
                    if diffImg(i,j)~=0
                        nonMatch=nonMatch+1;
                    end

                end
            end

            percMatch=1-(nonMatch/(40*40));
            disp(percMatch);

        end
        function percMatch=checkSaltAndPepper(img,char)


            ex=imread('Fonts/Salt & Pepper/example.png');
            test=ocr(ex);

            charfind=locateText(test,char);

            numChars=size(charfind);
            if numChars(1)~=1
                matchImgPath=append('Fonts/Salt & Pepper/',char,'.png');
                matchImg=imread(matchImgPath);

            else
                crop=imcrop(ex,charfind);

                matchImg=imresize(crop,[40 40]);


            end

            matchImg=rgb2gray(matchImg);

            %disp(size(img));
            %disp(size(matchImg));

            %rough match
            tempImg=imresize(img,[40 40]);
            tempImg=rgb2gray(tempImg);

            diffImg=matchImg-tempImg;
            %imshow(diffImg);

            nonMatch=0;

            for i=1:40
                for j=1:40
                    if diffImg(i,j)~=0
                        nonMatch=nonMatch+1;
                    end

                end
            end

            percMatch=1-(nonMatch/(40*40));
            disp(percMatch);

        end
        function percMatch=checkTimesNewRoman(img,char)

           % matchImgPath=append('Fonts/Times New Roman/',char,'.png');
            %matchImg=imread(matchImgPath);
            %matchImg=rgb2gray(matchImg);

            ex=imread('Fonts/Times New Roman/example.png');
            test=ocr(ex);

            charfind=locateText(test,char);
            numChars=size(charfind);
            if numChars(1)~=1
                matchImgPath=append('Fonts/Times New Roman/',char,'.png');
                matchImg=imread(matchImgPath);

            else
                crop=imcrop(ex,charfind);

                matchImg=imresize(crop,[40 40]);


            end

            matchImg=rgb2gray(matchImg);

            %disp(size(img));
            %disp(size(matchImg));

            %rough match
            tempImg=imresize(img,[40 40]);
            tempImg=rgb2gray(tempImg);

            diffImg=matchImg-tempImg;
            %imshow(diffImg);

            nonMatch=0;

            for i=1:40
                for j=1:40
                    if diffImg(i,j)~=0
                        nonMatch=nonMatch+1;
                    end

                end
            end

            percMatch=1-(nonMatch/(40*40));
            disp(percMatch);

        end
    end
end