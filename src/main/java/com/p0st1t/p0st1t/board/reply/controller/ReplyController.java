package com.p0st1t.p0st1t.board.reply.controller;


import com.p0st1t.p0st1t.board.freeboard.domain.Criteria;
import com.p0st1t.p0st1t.board.reply.domain.ReplyPageDTO;
import com.p0st1t.p0st1t.board.reply.domain.ReplyVO;
import com.p0st1t.p0st1t.board.reply.service.ReplyService;
import com.p0st1t.p0st1t.entity.User;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/replies/")
@AllArgsConstructor
public class ReplyController {

    private ReplyService rps;

    @PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> create(@RequestBody ReplyVO vo, @AuthenticationPrincipal User user) {
        if (user == null) {
            return new ResponseEntity<>("fail", HttpStatus.UNAUTHORIZED);
        }
        int insertCount = rps.register(vo);

        return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) :
                new ResponseEntity<>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @GetMapping("/cnt")
    @ResponseBody
    public int testCnt(Long bno) {
        System.out.println(rps.getCount(bno));
        return rps.getCount(bno);

    }

    @GetMapping(value = "/pages/{bno}/{page}", produces = {MediaType.APPLICATION_XML_VALUE
            , MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page
            , @PathVariable("bno") Long bno) {
        System.out.println(page);

        Criteria cri = new Criteria(page, 10);


        return new ResponseEntity<>(rps.getListPage(cri, bno), HttpStatus.OK);
    }

//	@GetMapping(value = "/pages/{bno}/{page}",produces = {MediaType.APPLICATION_XML_VALUE
//			, MediaType.APPLICATION_JSON_VALUE})
//	public ResponseEntity<List<ReplyVO>>getList(@PathVariable("page") int page
//		, @PathVariable("bno") Long bno){
//
//	log.info("Reply getList .. " + page +" "+ bno);
//	Criteria cri = new Criteria(page , 10);
//	log.info(cri);
//
//
//	return new ResponseEntity<List<>>(rps.getList(cri,bno), HttpStatus.OK);
//}

    @GetMapping(value = "/{rno}", produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
    public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno) {

        return new ResponseEntity<ReplyVO>(rps.get(rno), HttpStatus.OK);
    }

    @DeleteMapping(value = "/{rno}", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {

        return rps.remove(rno) == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
                : new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);

    }

    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
            value = "/{rno}",
            consumes = "application/json",
            produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("rno") Long rno) {

        vo.setRno(rno);

        return rps.modify(vo) == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) :
                new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
    }


}
