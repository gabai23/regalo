package com.internousdev.regalo.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;


public class InputChecker {

	/*
	 * 使い方
	 * propertyName：入力したい値の名称
	 * value：入力したい値
	 * minLength：最小値
	 * maxLength：最大値
	 *
	 * 以下booleanは使いたい文字型をtrueにする
	 * halfAlphabet：半角英字
	 * kanji：漢字
	 * hiragana：ひらがな
	 * katakana：カタカナ
	 * halfNumber：半角数字
	 * halfSymbol：半角記号
	 * fullSymbol：全角記号
	 *
	 * 例）ログインIDを調べたい場合
	 * errorList（任意のList） = check(ユーザーID, userId, 1, 8, true, false, false, false, true, false, false);
	 *
	 * errorListにエラーメッセージが格納されます
	 */
	public List<String> check(String propertyName, String value, int minLength, int maxLength, boolean halfAlphabet, boolean kanji, boolean hiragana, boolean katakana, boolean halfNumber, boolean halfSymbol, boolean fullSymbol) {

		//検証結果を格納する
		List<String> stringList = new ArrayList<>();
		//入力文字型
		List<String> characterTypeList = new ArrayList<>();

		//入力されているかチェック
		if(StringUtils.isEmpty(value)) {
			stringList.add(propertyName + "を入力してください");
		}

		//入力文字数をチェック
		else if(value.length() < minLength || value.length() > maxLength) {
			stringList.add(propertyName + "は" + minLength + "文字以上" + maxLength + "文字以下で入力してください");
		}



			//入力文字から正規表現を確定する
			String regularExpression = "";
			String error = "";

			if(halfAlphabet || kanji || hiragana || katakana || halfNumber || halfSymbol || fullSymbol) {
				regularExpression = "[^";
			}

			if(!(halfAlphabet) || !(kanji) || !(hiragana) || !(katakana) || !(halfNumber) || !(halfSymbol) || !(fullSymbol)) {
				error = "[^";
			}

			if(halfAlphabet){
				regularExpression += "a-zA-Z";
				characterTypeList.add("半角英字");
			} else {
				error += "a-zA-Z";
			}

			if(kanji){
				regularExpression += "一-龯";
				characterTypeList.add("漢字");
			} else {
				error += "一-龯";
			}

			if(hiragana){
				regularExpression += "ぁ-ん";
				characterTypeList.add("ひらがな");
			} else {
				error += "ぁ-ん";
			}

			if(halfNumber){
				regularExpression += "0-9";
				characterTypeList.add("半角数字");
			} else {
				error += "0-9";
			}

			if(halfSymbol){
				regularExpression += "@.,;:!#$%&'*+-/=?^_`{|}~";
				characterTypeList.add("半角記号");
			} else {
				error += "@.,;:!#$%&'*+-/=?^_`{|}~";
			}

			if(katakana){
				regularExpression += "ァ-ヶ";
				characterTypeList.add("カタカナ");
			} else {
				error += "ァ-ヶ";
			}

			if(fullSymbol){
				regularExpression += "＠．，；：！＃＄％＆’＊＋―／＝？＾＿｀｛｜｝～";
				characterTypeList.add("全角記号");
			} else {
				error += "＠．，；：！＃＄％＆’＊＋―／＝？＾＿｀｛｜｝～";
			}

			if(!StringUtils.isEmpty(regularExpression)) {
				regularExpression += "]+";
			}
			if(!StringUtils.isEmpty(error)) {
				error += "]+";
			}


			//判別してエラーメッセージを返す
			String characterType = "";
			for(int i = 0; i < characterTypeList.size(); i++){
				if(i == 0){
					characterType += characterTypeList.get(i).toString();
				} else {
					characterType += "、" + characterTypeList.get(i).toString();
				}
			}

			if(error.equals("")){
				if(value.matches(regularExpression)) {
					stringList.add(propertyName + "は" + characterType + "で入力してください");
				}
			} else {
				if(value.matches(regularExpression) || (!value.matches(error) && !value.equals(""))) {
					stringList.add(propertyName + "は" + characterType + "で入力してください");
				}
			}

		return stringList;

	}


	/*
	 * 入力パスワードと確認用パスワードが一致しているか検証
	 * PasswordResetConfirmActionで使用
	 */
	public List<String> passwordCheck(String password, String confirmPassword) {

		//
		List<String> stringList = new ArrayList<String>();
		if(!(password.equals(confirmPassword))) {
			stringList.add("入力されたパスワードが異なります");
		}
		return stringList;
	}

}
