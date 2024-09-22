package com.systex.hw3.game;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.LinkedList;

public class GameController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");

        GuessGame game = (GuessGame) session.getAttribute("game");

        if (game == null) {
            game = new GuessGame(10, 5);
            session.setAttribute("game", game);
        }

        LinkedList<String> errorMsgs = (LinkedList<String>) request.getAttribute("errors");
        if (errorMsgs == null) {
            errorMsgs = new LinkedList<>();
        }
        request.setAttribute("errors", errorMsgs);

        RequestDispatcher view = request.getRequestDispatcher("/game/guess.jsp");
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        GuessGame game = (GuessGame) session.getAttribute("game");
        LinkedList<String> errorMsgs = new LinkedList<>();
        request.setAttribute("errors", errorMsgs);

        String guessStr = request.getParameter("guess");
        int guess;

        try {
            guess = Integer.parseInt(guessStr);
        } catch (NumberFormatException e) {
            errorMsgs.add("請輸入有效的數字！");
            response.sendRedirect("gameController.do");
            return;
        }

        boolean isCorrect = game.guess(guess);

        if (isCorrect) {
            response.sendRedirect("youWin.jsp");
        } else if (game.getRemains() <= 0) {
            response.sendRedirect("youLose.jsp");
        } else {
            request.setAttribute("message", "猜錯了，再試一次！");
            response.sendRedirect("gameController.do");
        }
    }
}
