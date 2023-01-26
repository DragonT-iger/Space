package com.project.aop.logging;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.project.space.domain.Mem_InfoVO;

import lombok.extern.log4j.Log4j;

@Aspect
@Log4j
public class UserBehaviorLogging {
	//execution 표현식 참조 사이트
	//https://wpunch2000.tistory.com/22
	@Pointcut("execution(public * com.project.space.user..*.*(..))")
	private void loggingTargetBL() { //비지니스로직타겟 
		/*@Pointcut을 특정 메서드 앞에 기술할 수 있다.
		 *이때 주의사항 @Pointcut이 적용된 메서드는 반환타입이 void여야 한다.
		 * execution(public * com.project.space.user..*.*(..))은
		 * com.project.space.user로 시작하는 패키지(..)의 모든 클래스(*)와 모든메서드(*)와 모든파라미터((..))가 pointcut범위이된다
		 * */
	}
	@Pointcut("execution(* com.project.space..*.*(..))")
	public void loggingTargetCont() {} //서비스로직타겟 컨트롤의 모든메서드적용
		
	@Pointcut("execution(* com.project.space.user.naverlogintest..*.*(..))")
	public void loggingTargetNaverBL() {}
	
	@Around(value="loggingTargetBL()")
	public Object aroundBLlogging(ProceedingJoinPoint jp) throws Throwable{
		
		String str=jp.getSignature().toShortString();
		long start=System.nanoTime();
		try {
			Object result=jp.proceed();
			return result;
		}finally {
			long end=System.nanoTime();
			log.info(str+"Method Running Time: "+(end-start)+"ns");
			log.info("------------------------------");
		}
	}
	//before
	@Before(value="loggingTargetBL()")
	public void beforeBLlogging(JoinPoint jp) {
		Signature sign = jp.getSignature();
		log.info("before=========["+sign.toLongString()+"]");
		Object[] args=jp.getArgs(); //해당 메서드 인자값을 배열에 저장
		if(args!=null) { //인자값들이 있으면 반복해서 출력 
			for(Object arg: args) {
				//log.info("arg==>"+arg);
				if(arg!=null) {
					log.info("파라미터값 ==> "+arg.toString());
				}
				
			}
		}
	}
	//네이버BL Aspect
	@Around(value="loggingTargetNaverBL()")
	public Object aroundNaverBLlogging(ProceedingJoinPoint jp) throws Throwable{
		
		String str=jp.getSignature().toShortString();
		long start=System.nanoTime();
		try {
			Object result=jp.proceed();
			return result;
		}finally {
			long end=System.nanoTime();
			log.info(str+"Method Running Time: "+(end-start)+"ns");
			log.info("------------------------------");
		}
	}
	
	//컨트롤러 Aspect
	@Around(value="loggingTargetCont()")
	public Object aroundControllerlogging(ProceedingJoinPoint jp) throws Throwable{
		//HttpServletRequest 객체를 얻어옴
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		Mem_InfoVO user=(Mem_InfoVO)request.getSession().getAttribute("loginUser");
		String userid="비회원";
		if(user!=null) {
			userid = user.getUserid();
		}
		String contName = jp.getSignature().getDeclaringType().getSimpleName();
		String methodName = jp.getSignature().getName();
		String param =""; //파라미터 저장
		Map<String,Object> parameter = new HashMap<>(); // 파라미터 저장할 커넥션
		Object[] args=jp.getArgs();
		log.info("args toString====>"+args.toString());
		log.info("args length====>"+args.length);
		if(args!=null) { //인자값들이 있으면 반복해서 출력 
			for(Object arg: args) {
				log.info("arg==>"+arg);
				if(arg!=null) {
				param += arg.toString();
				}
			}
		}
		try {
			parameter.put("date", new Date()); //작동시간
			parameter.put("userid", userid); // 세션에저장된 userid 회원이아닐때는 비회원으로 출력
			parameter.put("servicename", contName); // 실행된 인터페이스 파일명
			parameter.put("methodname", methodName); // 메서드명
			parameter.put("param", param); //파라미터
			parameter.put("connectpath", request.getRequestURI()); //이동한 경로
			parameter.put("httpmethod", request.getMethod()); // http mothod get,post,put,del 
		}catch(Throwable t) {
			throw t;
		}
		Object result = jp.proceed();
		
		log.info("Controller Log = "+parameter);
		return result;
	}	
}
