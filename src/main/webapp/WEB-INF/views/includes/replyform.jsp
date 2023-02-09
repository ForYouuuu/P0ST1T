<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
 <!-- 댓글 -->
<div class="container mt-5" >
   <div class="row mb-3">
        <div class="col-1"> </div>

          <div class="col-10 card" style="padding-top:15px;">
             <div class="pannel pannel default">
                <i class ="fa fa-comments fa-fw"></i> 댓글
             </div>


             <div class ="panel-body">
                <ul class ="chat">
                <!-- 댓글 들어갈부분 -->
                </ul>
                <!-- end ul -->
             </div>
          <div class="pannel-footer">

          </div>
          <!-- pannel-footer end -->
       </div>
</div>
<div class="row mb-5">
     <div class="col-1"> </div>
           <div class ="col-10 card pt-2">
                <label for ="reply">댓글 작성</label>
                <form name ="commentInsert" class="mt-2 mb-2">
                    <div class="d-flex flex-column input-group">

                       <div class="d-flex align-items-center mb-2"><label style="width:7%">작성자</label> <input type="text" class="form-control" style="margin-left:10px; width:200px;" name ="writer" value="${user.nickname}" id="replyer2" readonly></div>
                       <div class="d-flex align-items-center mb-2"><label style="width:7%" for="reply2">글내용</label><textarea class="form-control replytext" rows="3" maxlength="2000" style="margin-left:10px; margin-right:10px; width:86%;"  name ="content" id="reply2"></textarea>

                        <span class="input-group-btn" style="float:right; width:7%;">
                            <button class="btn btn-outline-primary" type="button"  id ="commentInsert">등록</button>
                        </span></div>
                    </div>
                </form>
           </div>
    </div>
</div>


  <!-- Modal -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
  	aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog">
  		<div class="modal-content">
  			<div class="modal-header">
  				<button type="button" class="close" data-dismiss="modal"
  					aria-hidden="true">&times;</button>
  				<h4 class="modal-title" id="myModalLabel">댓글 수정</h4>
  			</div>
  			<div class="modal-body">
  				<div class ="modal-group">
  					<label>댓&emsp;글</label>
  					<textarea class ="replytext form-control" rows="3" name="reply" value ="new reply"></textarea>
  				</div>
  				<div class ="modal-group">
  					<label>작성자</label>
  					<input class ="form-control" name="replyer" value ="replyer" readonly>
  				</div>


  			</div>
  			<div class="modal-footer">
  				<button type="button" class="btn btn-warning" id="modalModBtn">수정</button>
  				<button type="button" class="btn btn-danger" id="modalRmvBtn">삭제</button>
  				<button type="button" class="btn btn-default" data-dismiss="modal" id="modalCloBtn">취소</button>
  			</div>
  		</div>
  		<!-- /.modal-content -->
  	</div>
  	<!-- /.modal-dialog -->
  </div>
  <!-- /.modal -->