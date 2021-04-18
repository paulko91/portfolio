package org.zerock.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.loginVO.SungjukVO;

@Controller
@RequestMapping("/sungjuk/*")
public class SunjukController { // ����ǥ �Է�
	private static final Logger logger = LoggerFactory.getLogger(SunjukController.class);

	@RequestMapping(value = "/sungjuk", method = RequestMethod.GET)
	public String sungjuk(Model model) {

		logger.info("==============Sungjuk1 ==========");

		ArrayList arrList = new ArrayList();
		arrList.add("ȫ�浿");
		arrList.add("ȫ���");
		arrList.add("��浿");
		arrList.add("����");
		arrList.add("�ֱ浿");
		arrList.add("�ֱ��");
		arrList.add("�̱浿");
		arrList.add("�̱��");
		arrList.add("�ڱ浿");
		arrList.add("�ڱ��");
		model.addAttribute("arrList", arrList);

		ArrayList arrList2 = new ArrayList();
		arrList2.add("�İ�");
		arrList2.add("�İ�");
		arrList2.add("�İ�");
		arrList2.add("�İ�");
		arrList2.add("�İ�");
		arrList2.add("���İ�");
		arrList2.add("���İ�");
		arrList2.add("���İ�");
		arrList2.add("���İ�");
		arrList2.add("���İ�");
		model.addAttribute("arrList2", arrList2);

		return "sungjuk/sungjuk";
	}

	@RequestMapping(value = "/sungpo", method = RequestMethod.POST)
	public String SungjukPo(SungjukVO sungjukVo, Model model) {

		logger.info("==============SungjukPo ==========");

		String[] name = sungjukVo.getName().split(","); // �̸�
		String[] junge = sungjukVo.getJunge().split(","); // �����а���
		String[] java = sungjukVo.getJava().split(","); // �ڹ�
		String[] program = sungjukVo.getProgram().split(","); // ���α׷���
		String[] tongge = sungjukVo.getTongge().split(","); // �����
		String[] juneng = sungjukVo.getJuneng().split(","); // ���꿵��
		String[] junCal = sungjukVo.getJunCal().split(","); // �������

		ArrayList arrList = new ArrayList();
		for (int i = 0; i < 10; i++) {
			SungjukVO sung = new SungjukVO();
			sung.setName(name[i]);
			sung.setJunge(junge[i]);
			sung.setJava(java[i]);
			sung.setProgram(program[i]);
			sung.setTongge(tongge[i]);
			sung.setJuneng(juneng[i]);
			sung.setJunCal(junCal[i]);
			arrList.add(sung);

		}
		
		ArrayList numArr = new ArrayList();

		model.addAttribute("sungjuk", arrList);

		return "sungjuk/sungjukDisplay";
	}
}
