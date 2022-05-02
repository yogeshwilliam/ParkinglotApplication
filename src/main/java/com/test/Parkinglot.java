package com.test;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import redis.clients.jedis.Jedis;

/**
 * Servlet implementation class Parkinglot
 */
@WebServlet("/Parkinglot")
public class Parkinglot extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final boolean[][] lot_arr = new boolean[4][10];
	private final Map<String,ArrayList<History>> history = new HashMap<>();
    public Parkinglot() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String choice = request.getParameter("page");
		switch(choice) {
		case "Choicetype":
			getServletContext().getRequestDispatcher("/Choicetype.jsp").forward(request, response);
			break;
		case "Checkin":
			getServletContext().getRequestDispatcher("/Checkin.jsp").forward(request, response);
			break;
		case "Checkout":
			getServletContext().getRequestDispatcher("/Checkout.jsp").forward(request, response);
			break;
		case "Find":
			getServletContext().getRequestDispatcher("/Find.jsp").forward(request, response);
		case "Lots":
			request.setAttribute("array", lot_arr);
			getServletContext().getRequestDispatcher("/Showlots.jsp").forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("resource")
		Jedis store = new Jedis("redis",6379);
		String choice = request.getParameter("choice");
		switch(choice) {
		case "checkin": {
		String temp;
		String vno = request.getParameter("vno").toUpperCase();
		String vtype = request.getParameter("vtype").toUpperCase();
		String lot = request.getParameter("lot").toUpperCase();
		String intime = request.getParameter("intime").toUpperCase();
		String temp_lot = checkin(lot);
		if(temp_lot != null) {
			temp = ""+vno+","+vtype+","+temp_lot+","+intime;
			store.set(vno, temp);
			request.setAttribute("color", "green");
			request.setAttribute("sucess", "*The Vechile is parked at "+temp_lot);
		    request.getRequestDispatcher("/Checkin.jsp").forward(request, response);
		} else {
			request.setAttribute("color", "red");
			request.setAttribute("sucess", "*The "+lot+" is full");
			request.getRequestDispatcher("/Checkin.jsp").forward(request, response);
		}
		}
		break;
		case "checkout": {
			String temp = "";
			String[] input;
			String vno = request.getParameter("vno").toUpperCase();
			String outtime = request.getParameter("outtime").toUpperCase();
			if(store.get(vno)!=null) {
				input = store.get(vno).split(",");
			    try {
					temp = checkout(input[1],input[3],outtime);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			    if(temp != null) {
			    	store.del(vno);
			    	lot_arr[input[2].charAt(0)-'A'][input[2].charAt(1)-'1'] = false;
			    	if(history.get(vno)==null) {
				    	ArrayList<History> his = new ArrayList<>();
				    	his.add(new History(""+input[2].charAt(0), input[3], outtime));
				    	history.put(vno, his);			    	
				    } 
				    else if(history.get(vno).size()==5) {
				    	history.get(vno).remove(0);
				    	history.get(vno).add(new History(""+input[2].charAt(0), input[3], outtime));
				    } else {
				    	history.get(vno).add(new History(""+input[2].charAt(0), input[3], outtime));
				    }
			        request.setAttribute("color", "green");
				    request.setAttribute("sucess", "*Vechile checked out sucessfully");
		    		request.setAttribute("cost", temp);
			        request.getRequestDispatcher("/Checkout.jsp").forward(request, response);
			    } else {
			    	request.setAttribute("color", "red");
					request.setAttribute("sucess", "*Invalid time");
					request.setAttribute("cost", "Rs.0.00");
					request.getRequestDispatcher("/Checkout.jsp").forward(request, response);
			    }
			} else {
				request.setAttribute("color", "red");
				request.setAttribute("sucess", "*The Vechile("+vno+") is not parked");
				request.setAttribute("cost", "Rs.0.00");
				request.getRequestDispatcher("/Checkout.jsp").forward(request, response);
			}
		}
			break;
		case "find": {
			String temp;
			String[] input;
			String vno = request.getParameter("vno").toUpperCase();
			if(store.get(vno)!=null && history.get(vno)!=null) {
				input = store.get(vno).split(",");
			    temp = find(input);
			    request.setAttribute("avail","yes");
			    request.setAttribute("data",history.get(vno));
			    request.setAttribute("color", "green");
				request.setAttribute("sucess", temp);
			    request.getRequestDispatcher("/Find.jsp").forward(request, response);
			} else if(store.get(vno)==null && history.get(vno)!= null){
				request.setAttribute("avail","yes");
				request.setAttribute("data",history.get(vno));
				request.setAttribute("color", "red");
				request.setAttribute("sucess", "*The Vechile "+vno+" is not parked");
				request.getRequestDispatcher("/Find.jsp").forward(request, response);
			} else if(store.get(vno)!=null && history.get(vno)== null) {
				input = store.get(vno).split(",");
			    temp = find(input);
			    request.setAttribute("avail","no");
			    request.setAttribute("color", "green");
				request.setAttribute("sucess", temp);
			    request.getRequestDispatcher("/Find.jsp").forward(request, response);
			} else {
				request.setAttribute("avail","no");
				request.setAttribute("color", "red");
				request.setAttribute("sucess", "*The Vechile "+vno+" is not parked");
				request.getRequestDispatcher("/Find.jsp").forward(request, response);
			}
		}
			break;
		}
	}
	private String lot_no(String lot) {
		int i = lot.charAt(0)-'A';
		int j = 0;
		while (j<lot_arr[0].length) {
			if(!lot_arr[i][j]) {
				lot_arr[i][j] = true;
				break;
			}
			j++;
		}
		return (j==10)? null:""+(j+1);
	}
	static int cost(String vtype, long h) {
        int rate, cost;
        if (vtype.equals("CAR")) {
            rate = 50;
        } else {
            rate = 10;
        }
        cost = (int) (h * rate);
        return cost;
    }

    static long hours(String t1, String t2) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
        Date d1 = sdf.parse(t1);
        Date d2 = sdf.parse(t2);
        return d2.getTime() - d1.getTime();
    }
	public String checkin(String lot) {
		String temp = lot_no(lot); 
		if(temp != null) {
			return ""+lot+""+temp;
		} else {
			return null;
		}
	}
	public String checkout(String vtype,String intime,String outtime) throws ParseException {
		int cost;
		long h;
        long d = hours(intime, outtime);
        h = (d / (1000 * 3600)) % 24;
        cost = cost(vtype, h);
        return (cost<0)? null:"The parking duration of "+h+" hours cost Rs."+cost+"";
	}
	public String find(String[] input) {
        return "Vechile "+input[0]+" is parked at the "+input[2]+" lot at "+input[3]+".";
	}
}
