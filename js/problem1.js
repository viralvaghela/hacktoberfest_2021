//Breaking the record problem (Hackerank)
const breaking_record=((score)=>{
    // Write your code here
    let max=scores[0];
let min =scores[0];
let max_incre=0;
let min_incre=0;
for(let n=1;n<scores.length;n++){
if(scores[n]>max)       
 
{                  
     max_incre++;
     max=scores[n];
 }
 else if(scores[n]<min){
     min_incre++;
     min=scores[n];
 }
}
return [max_incre,min_incre]

});
breaking_record([1,11,2,3,12,3]);
