<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
<script type="text/javascript">
	$(document).ready(function() {
						console.log("=========");
						console.log("JS TEST");

						var bnoValue = '<c:out value ="${vo.bno}"/>';

						var replyUL = $(".chat");

						showList(1);

                        function setPage(replyCnt){

                            console.log(replyCnt);
                            pageNum =Math.ceil(replyCnt/10.0);
                            showList(pageNum);

                            return;
                        }

						function showList(page) {


							replyService.getList({bno : bnoValue,page : page || 1},

							function(replyCnt,list) {

								console.log("replyCnt" + replyCnt);
								console.log("list" +list);


								let str = "";

								if (list == null
										|| list.length == 0) {
									replyUL.html("");
									return;
								}
								for (var i = 0, len = list.length || 0; i < len; i++) {
                                    var id = "${user.userId}";
                                    str += "<li class='needAlter'>";

                                    if(list[i].replydate != list[i].updatedate){
                                    str += "<div><small class='needRight'>"
                                    		+ replyService.displayTime(list[i].updatedate)
                                    		+ " 수정됨</small>";
                                    }else{
									str += "<div><small class='needRight'>"
											+ replyService
													.displayTime(list[i].replydate)
											+ "</small>";
                                    }

                                    str+="<strong>"+list[i].replyer + "</strong></div>";

                                    str += "<div class='d-flex justify-content-between align-items-center'>"
                                    + "<div style='width:88%'>"+list[i].reply+"</div>";


                                    if(id == list[i].replyerid){
									str += "<button class='btn btn-primary needBtnRight' style='width:10%' data-rno='"
         									 +list[i].rno +"'>수정</button>";
                                    }
                                    str += "</div></li>"
         							str+= "<hr>";

								}
								replyUL.html(str); //댓글 뿌려주는부분
								showReplyPage(replyCnt); //댓글에대한 페이지 뿌리는부분
							}); //endfunction
						} //end showList





		var modal =$(".modal");
		var modalInputReply =modal.find("textarea[name='reply']");
		var modalInputReplyer = modal.find("input[name='replyer']");
		var modalInputReplydate = modal.find("input[name='replydate']");



		var modalModBtn =$("#modalModBtn");
		var modalRmvBtn =$("#modalRmvBtn");
		var modalCloBtn =$("#modalCloBtn");



		$('#commentInsert').on("click", function(e){ // 신규 입력 댓글인 경우에

             var reply2 = $('#reply2').val();
             var replyer2 = $('#replyer2').val();
             var replyerid = "${user.userId}";
             if(reply2 == ""){
                alert("댓글 내용을 입력해주세요.");
                return;
             }
               console.log(reply2+"[][][][][]");
               console.log(replyer2+"[][][][][][][]");
               console.log(replyerid+"[][][][][][][]");

           var reply = {



            					replyer:replyer2,
            					reply:reply2,
            					replyerid:replyerid,
            					bno:bnoValue
            			};

            			replyService.add(reply,function(result){ // 애드 하고 나서 function진행
            				if(result == "success"){$('#reply2').val('');
            				    alert("댓글이 등록되었습니다.");

            				}

            				modal.find("input").val("");
            				modal.modal("hide"); // register 누르면 사라지게



                                var return_data;


                                $.ajax({
                                    type :'get',




                                    url:'/replies/cnt',
                                    data:{'bno':bno},

                                    success:function(result){
                                        setPage(result);
                                    }
                                });

            			});

		});





		$(".chat").on("click","button",function(){  //chat이라는 클래스 안의 li를 누르고 진행->function진행
			var rno = $(this).data("rno");   // rno를 받아옴 (클릭하면 li를)

			replyService.get(rno,function(reply){
				modalInputReply.val(reply.reply);
				modalInputReplyer.val(reply.replyer);
				modal.data("rno",reply.rno);
				modal.find("button[id != 'modalCloBtn']").hide();


				modalModBtn.show();
				modalRmvBtn.show();
				modalInputReplydate.closest("div").show(); // 가장 가까운 조상을 hide() 해줘

				$(".modal").modal("show");  // modalCloBtn,modalModBtn,modalRmvBtn 을 show 해주는
			});
		});


		modalModBtn.on("click",function(e){
			var reply={rno:modal.data("rno") , reply:modalInputReply.val()};

			replyService.update(reply,function(result){
			    if(result == "success"){
                    alert("댓글이 수정되었습니다.");
                    }
				modal.modal("hide");
				showList(pageNum);

			});

		});

		modalRmvBtn.on("click",function(e){
			var rno=modal.data("rno");
			replyService.remove(rno,function(result){
				if(result == "success"){
                    alert("댓글이 삭제되었습니다.");
                    }
				modal.modal("hide");
				showList(pageNum);

			});
		});

		modalCloBtn.on("click",function(e){
        				modal.modal("hide");


        		});

		var pageNum=1;
		var replyPageFooter =$(".pannel-footer");

		function showReplyPage(replyCnt){
			var endNum= Math.ceil(pageNum/10.0)*10;
			var startNum = endNum-9;
			var prev = startNum != 1;
			var next = false;

			if(endNum * 10 >= replyCnt){
				endNum =Math.ceil(replyCnt / 10.0 );
			}
			if(endNum * 10 <replyCnt){
				next = true;
			}
			var str ="<ul class ='pagination justify-content-center'>";
			if(prev){
				str+="<li class ='page-item'>"+
				"<a class ='page-link' href='"+(startNum-1)+"'>Prev</a></li>";
			}

			for(var i=startNum; i<=endNum; i++){
				var active = pageNum == i?'active':'';
				str += "<li class ='page-item "+active +"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			}
				str += "</ul></div>";
				console.log(str);
				replyPageFooter.html(str);
		}

		replyPageFooter.on("click","li a",function(e){
			e.preventDefault();
			console.log("click page...");

			var targetPageNum = $(this).attr("href");
			console.log("targetPageNum" +targetPageNum);
			pageNum = targetPageNum;
			showList(pageNum);

		});


	});
</script>




<script>
	    var bno = ${vo.bno};
		var id = "${user.userId}";


		 function updateLike(){
		     $.ajax({
		            type : "POST",
		            url : "get",
		            dataType : "json",
		            data : {'bno' : bno, 'id' : id},
		            error : function(){
		               alert("로그인 상태가 아닙니다.");
		            },
		            success : function(likeCheck) {

		                    if(likeCheck == 0){
		                    	alert("추천완료.");
		                    	location.reload();
		                    }
		                    else if (likeCheck == 1){
		                     alert("추천취소");
		                    	location.reload();


		                }
		            }
		        });
		 }

</script>