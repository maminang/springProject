package kr.co.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class SampleAdvice {

	@Before("execution(* kr.co.service.MessageService*.*(..))")
	public void startLog(JoinPoint jp) {
		System.out.println("::::::::::");
		System.out.println(Arrays.toString(jp.getArgs()));
		System.out.println(jp.getKind());
		System.out.println(jp.getTarget());
		System.out.println("시작합니다");
		System.out.println("::::::::::");
	}

	@After("execution(* kr.co.service.MessageService*.*(..))")
	public void endLog() {
		System.out.println("::::::::::");
		System.out.println("끝났습니다");
		System.out.println("::::::::::");
	}

	@Around("execution(* kr.co.service.MessageService*.*(..))")
	public Object timeLog(ProceedingJoinPoint pjp) throws Throwable {
		long start = System.currentTimeMillis();

		Object result = pjp.proceed();

		long end = System.currentTimeMillis();

		System.out.print("실행시간 : ");
		System.out.println(end - start);

		return result;
	}
}
