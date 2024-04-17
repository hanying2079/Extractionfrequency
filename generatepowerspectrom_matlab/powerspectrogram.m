%filename='D:\1-科研\20221219周期\data\up\CSES_01_EFD_3_L02_A1_051920_20190109_185702_20190109_193136_000.h5'
close all
%timefilefolder="20200722-0726-122"

fre1=[20247,14442,9758,5855]
fre2=[20833,15027,10343,6440]
for jj=1:4%(fre1)%length(fre1) 遍历频率
    
        path=strcat("E:\1-research\CSES-data\data_h5\130_20190106_0110","\");
        dirOutput = dir(fullfile(path,'*h5')); % 遍历文件夹下所有.h5文件 
        fileNames = {dirOutput.name};
        k=length(fileNames)
        for i=1:k%k  遍历文件中的文件
            onefilename=fileNames(i)    
            %fileName = nameTmp(1:length(nameTmp)-4);  
            filename=strcat(path,onefilename)    
            [str_path,str_name,str_ext]=fileparts(filename);
            ud_Pos=strsplit(str_name,'_');
            orbitno=ud_Pos(7)%取轨道号

            data=h5read(filename,'/A133_P');
            utctimedata=h5read(filename,'/UTC_TIME');%读取UTC绝对时间值
            geolatdata=h5read(filename,'/GEO_LAT');
            geolondata=h5read(filename,'/GEO_LON');
            geolonlatdata=[geolondata;geolatdata];
            f=h5read(filename,'/FREQ');

           str_name1=regexp(str_name, '_', 'split');
           strname=str_name1(1)+str_name1(2)+'  '+str_name1(3)+str_name1(4)+'  '+str_name1(5)+'  '+str_name1(8)+'  '+'Orbit:'+str_name1(7)
           timefolder=regexp('-', 'split');
           orbitnum=str2num(str_name1(7));
          if mod(orbitnum,2)==0         %只取down--0  up--1数据 ****
                
                %f_low=405
                %f_high=415    
                f1=fre1(jj)
                f2=fre2(jj)

                filefrename=[num2str(f1),'-',num2str(f2)];
                [,datarange]=f(f>f1 & f<f2)

                f_low=find(f==datarange(1))-2
                f_high=find(f==datarange(end)) 
               
                maxlon=length(geolondata)    
                imagesc(geolondata(:,1:maxlon),f(:,f_low:f_high),data(f_low:f_high,1:maxlon),[0,0.0002]);  
                             
                
                set(gca,'ydir','normal','FontName','Adobe Arabic','FontSize',10);
                ylabel('Frequency(Hz)','FontName','Adobe Arabic','FontSize',10);%纵坐标
                %----------------------------------------------------------------------------------------------------
               
                %%%%%%%%%%%%%%%%%Lat维度------------------------------
                t6=geolondata;        
                t7=geolatdata;            
                geolon_low=t6(1)
                geolon_high=t6(maxlon)    
                step=(maxlon-1)/9
                set(gca,'xtick',(1:step:maxlon));
                set(gca,'xtick',[]);
                %x_tick=get(gca,'Xtick');   
                roundn(t7(1),-2)
                label21=strcat('Lat:',num2str(roundn(t7(1),-2)));
                label22=num2str(roundn(t7(round(step)),-2))
                label23=num2str(roundn(t7(round(step*2)),-2))
                label24=num2str(roundn(t7(round(step*3)),-2))
                label25=num2str(roundn(t7(round(step*4)),-2))
                label26=num2str(roundn(t7(round(step*5)),-2))
                label27=num2str(roundn(t7(round(step*6)),-2))
                label28=num2str(roundn(t7(round(step*7)),-2))
                label29=num2str(roundn(t7(round(step*8)),-2))
                label210=num2str(roundn(t7(round(step*9)),-2))   
                set(gca,'XTickLabel',{label21,label22,label23,label24,label25,label26,label27,label28,label29,label210});%时间
                text( 'string',label21, 'Units','normalized','position',[-0.05,-0.03],  'FontSize',10,'FontName','Adobe Arabic');  
                %text( 'string',label22, 'Units','normalized','position',[0.085,-0.05],  'FontSize',10,'FontName','Adobe Arabic');  
                %text( 'string',label23, 'Units','normalized','position',[0.2,-0.05],  'FontSize',10,'FontName','Adobe Arabic');  
                text( 'string',label24, 'Units','normalized','position',[0.3,-0.03],  'FontSize',10,'FontName','Adobe Arabic');  
                %text( 'string',label25, 'Units','normalized','position',[0.43,-0.05],  'FontSize',10,'FontName','Adobe Arabic');  
                %text( 'string',label26, 'Units','normalized','position',[0.53,-0.05],  'FontSize',10,'FontName','Adobe Arabic');  
                text( 'string',label27, 'Units','normalized','position',[0.63,-0.03],  'FontSize',10,'FontName','Adobe Arabic');  
                %text( 'string',label28, 'Units','normalized','position',[0.75,-0.05],  'FontSize',10,'FontName','Adobe Arabic');  
                %text( 'string',label29, 'Units','normalized','position',[0.86,-0.05],  'FontSize',10,'FontName','Adobe Arabic');  
                text( 'string',label210, 'Units','normalized','position',[0.97,-0.03],  'FontSize',10,'FontName','Adobe Arabic');    
                %%%%%%%%%%%%%%%%%%%%%%%%%%Log经度--------------------------
                label31=strcat('Lon:',num2str(round(t6(round(1)),2)));
                label32=num2str(round(t6(round(step*1)),2));
                label33=num2str(round(t6(round(step*2)),2));
                label34=num2str(round(t6(round(step*3)),2));
                label35=num2str(round(t6(round(step*4)),2));
                label36=num2str(round(t6(round(step*5)),2));
                label37=num2str(round(t6(round(step*6)),2));
                label38=num2str(round(t6(round(step*7)),2));
                label39=num2str(round(t6(round(step*8)),2));
                label310=num2str(round(t6(round(step*9)),2));
                dy2=-0;
                dx=-25;

                figFont=10;
                text( 'string',label31, 'Units','normalized','position',[-0.05,-0.1],  'FontSize',10,'FontName','Adobe Arabic');  
               % text( 'string',label32, 'Units','normalized','position',[0.085,-0.1],  'FontSize',10,'FontName','Adobe Arabic');  
                %text( 'string',label33, 'Units','normalized','position',[0.2,-0.1],  'FontSize',10,'FontName','Adobe Arabic');  
                text( 'string',label34, 'Units','normalized','position',[0.3,-0.1],  'FontSize',10,'FontName','Adobe Arabic');  
               % text( 'string',label35, 'Units','normalized','position',[0.43,-0.1],  'FontSize',10,'FontName','Adobe Arabic');  
                %text( 'string',label36, 'Units','normalized','position',[0.53,-0.1],  'FontSize',10,'FontName','Adobe Arabic');  
                text( 'string',label37, 'Units','normalized','position',[0.63,-0.1],  'FontSize',10,'FontName','Adobe Arabic');  
                %text( 'string',label38, 'Units','normalized','position',[0.75,-0.1],  'FontSize',10,'FontName','Adobe Arabic');  
                %text( 'string',label39, 'Units','normalized','position',[0.86,-0.1],  'FontSize',10,'FontName','Adobe Arabic');  
                text( 'string',label310, 'Units','normalized','position',[0.97,-0.1],  'FontSize',10,'FontName','Adobe Arabic');      
                set(gcf,'Position',[800 800 550 230]); 
                cb=colorbar('FontName','Adobe Arabic','FontSize',10);
               %colormap jet
              % h = colorbar('position',[0.93 0.23 0.03 0.20],'fontsize',8);
               %h = colorbar('position',[0.93 0.13 0.03 0.70],'fontsize',8);
               %set(get(h,'Title'),'string','(mV/m/Hz^{0.5})');
               cb.Label.String = 'mV/m/Hz^{1/2}';
               %strEFD = strcat(timefolder(1),',',' EFD-VLF-Power2PSD',',',' Orbit:',orbitno); %特定文件特定修改，或者获取文件夹名称      
               title(strname,'fontsize',10,'FontName','Times New Roman');

                
                geolowstr=num2str(round(geolondata(1)));
                geohighstr=num2str(round(geolondata(maxlon)));
                saveas(gcf,strcat('E:\1-research\~2024投稿\补充实验\sepectrom\',num2str(fre1(jj)),'_',orbitno,'_',geolowstr,'_',geohighstr,'_',num2str(i),'.png')); 
            
          %  end
            close all;
          end
        end
end