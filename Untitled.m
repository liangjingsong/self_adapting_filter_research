f_sample=1e6;

time=5;
N=128*3;

time=[1/f_sample:1/f_sample:time];

noise= 1*sin(10000*2*pi*time+0)...
          +0/3*sin(30000*2*pi*time+0)...
          +0/5*sin(50000*2*pi*time+0)...
          +0/7*sin(70000*2*pi*time+0)...
          +0/9*sin(90000*2*pi*time+0);
  
sign=1*sin(10001*2*pi*time);

sign_with_noise=noise+sign;



noise_for_filter= 1*sin(10000*2*pi*time+0)...
                    +2*sin(30000*2*pi*time-1)...
                    +2*sin(50000*2*pi*time+0)...
                    +2*sin(70000*2*pi*time+0)...
                    +5*sin(90000*2*pi*time+1);
                
noise_for_filter=noise;

w=zeros(N+1,1);
end_time=4;
mui=4e-9;

y=zeros(1,end_time*f_sample);
e=zeros(1,end_time*f_sample);

for i=[1:end_time*f_sample]
   y(i)=noise_for_filter(i:i+N)*w;
   e(i)=sign_with_noise(i+N)-y(i);
   w=w+mui*e(i)*noise_for_filter(i:i+N).';
end





