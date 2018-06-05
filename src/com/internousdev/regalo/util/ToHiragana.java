package com.internousdev.regalo.util;

public class ToHiragana {

	private String searchWord;

	public String toZenkakuHiragana(String searchWord){


		//Stringの接続用
		StringBuffer sb= new StringBuffer(searchWord);

		for (int i = 0; i< sb.length(); i++){


			//i番目のchar値をcに代入
			char c =sb.charAt(i);



			//カタカナならi番目のchar値をひらがなにする
			if(c >= 'ァ' && c <= 'ン'){
				sb.setCharAt(i, (char)(c - 'ァ' + 'ぁ'));

			}else if (c == 'ヵ'){
				sb.setCharAt(i, 'か');

			}else if (c == 'ヶ'){
				sb.setCharAt(i, 'け');

			}else if (c == 'ヴ'){
				sb.setCharAt(i,'う');
				sb.insert(i + 1, '゛');
				i++;
				}
		}
		System.out.println(searchWord);
		return sb.toString();
	}
	public String getSearchWord(){
		return searchWord;
	}
	public void setSearchWord(String searchWord){
		this.searchWord=searchWord;
	}

}
