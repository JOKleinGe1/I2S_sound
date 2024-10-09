% matlab / octave script pour générer un fichier en hexa lisible par
% verilog avec la fonction $readmemh
% voir ici :
% https://projectf.io/posts/initialize-memory-in-verilog/

y = [sign(y)*95; sign(y)*95 ]';
y2c = (256-abs(y)) .* (y<0) + y .* (y>=0);

fid = fopen('wave440_32k.mem16','w');
fprintf(fid,"%02x%02x\n",y2c');
fclose(fid);


fid = fopen('wave440_32k.mif','w');
[d,w] = size(y2c);
fprintf(fid,"WIDTH=%d;\n",w*8);
fprintf (fid,"DEPTH=%d;\n",d);
fprintf (fid,"ADDRESS_RADIX=HEX;\n",d);
fprintf (fid,"DATA_RADIX=HEX;\n",d);
fprintf (fid,"CONTENT BEGIN\n",d);
for i=1:d
  fprintf(fid,"%06x:%02x%02x;\n",i-1,y2c(i,:));
endfor
fprintf (fid,"END; \n",d);
fclose(fid);

