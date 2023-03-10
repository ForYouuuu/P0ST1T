console.log("reply Module..");

var replyService = (function(){



   //댓글 추가
   function add(reply,callback){
   console.log("reply.js 에서 ");

   $.ajax({
      type:'post',
      url:'/replies/new',  
      data: JSON.stringify(reply),
      contentType:"application/json; charset=utf-8",
      
      success:function(result,status,xhr){
         if(callback){
            callback(result);
         }
      },
      
      error:function(){
          alert("로그인이 필요한 기능입니다.");

      }
      
   });

   }



   function getList(param ,callback,error){
      var bno = param.bno;
      var page = param.page || 1;
      
      $.getJSON("/replies/pages/" + bno + "/" +page  ,   //param
      
      function(data){
         if(callback){
            //callback(data);  //댓글 목록 호출한거고
              callback(data.replyCnt,data.list);   //이번엔 카운트랑 데이터리스트까지
         }
      }).fail(function(xhr,status,er){
         if(error){
            error(er);
         }
      });
      

   }
   
      
   function remove(rno,callback,error){
      $.ajax({
         type:'delete',
         url:'/replies/' + rno,
         
         success:function(deleteResult,status,xhr){
            
            if(callback){
               callback(deleteResult);
            }
         },
         error:function(xhr,status,er){
            
            if(error){
               error(er);
            }
         }
      
      });
      
      
   }
   
   
   function update(reply,callback,error){
     console.log("update RNO=>" +reply.rno);
     
     $.ajax({
        type:'put',
        url:'/replies/'+reply.rno,
        data:JSON.stringify(reply),
        contentType:"application/json; charset=utf-8",
        
        success:function(result,status,xhr){
         if(callback){
            callback(result);
         }
      },
      
      error:function(xhr,status,er){
         if(error){
            error(er);
         }
      }
        
     });
     
   }
   
   function get(rno,callback,error){
   
   $.get('/replies/'+ rno,
   
   function(result){
      if(callback){
         callback(result);
      }
      
   }).fail(function(xhr,status,er){
      if(error){
         error(er);
      }
   });
   
   
   
   }

   function leadingZeros(n, digits) {
   	    var zero = '';
   	    n = n.toString();

   	    if (n.length < digits) {
   	        for (i = 0; i < digits - n.length; i++)
   	            zero += '0';
   	    }
   	    return zero + n;
   	}
   
   function displayTime(timeValue){
      var today = new Date();
      var todayDate = leadingZeros(today.getFullYear(),4)+'-'+
                      leadingZeros(today.getMonth() + 1,2)+'-'+
                      leadingZeros(today.getDate(), 2);
      var dateObj = new Date(timeValue);
      var writeDate = leadingZeros(dateObj.getFullYear(),4)+'-'+
                      leadingZeros(dateObj.getMonth() + 1,2)+'-'+
                      leadingZeros(dateObj.getDate(), 2);

      var isPast = todayDate > writeDate;
      var str = "";

      console.log(todayDate);
      console.log(writeDate);

      
      if(!isPast){ //하루 이상 차이가 나는지에대한 여부
         var hh = dateObj.getHours();
         var mi = dateObj.getMinutes();
         var ss = dateObj.getSeconds();
         
         return [(hh>9?'':'0') + hh,
          ':', (mi>9?'':'0')+mi,  
          ':', (ss>9?'':'0')+ss].join('');  // 09시 -> 9시 로 표현하고싶어서     
      }else{
         var yy = dateObj.getFullYear();
         var mm = dateObj.getMonth()+1;
         var dd = dateObj.getDate();
         
         return [yy, '/' , (mm>9 ? '' : '0')+mm,'/',(dd>9?'':'0')+dd].join('');
      }   
   }
   return{add:add,getList:getList,remove:remove,update:update,get:get,displayTime:displayTime};
   
   
	})();

