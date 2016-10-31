<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  <script src="<%=request.getContextPath()%>/js/join.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  </head>
  <body>
    <div class="contain_box">
      <div class="container">
        <div class="row">
          <div class="page-header">
            <h2>멀티모달 테스트</h2>
          </div>
        </div>
	<a data-toggle="modal" href="#myMo"  data-target="#myMo"class="btn btn-primary">Launch modal</a>
        <div class="row 2nd">
 
        </div>
      </div>
    </div>
    <!-- first modal -->
    <div class="modal" id="myMo" aria-hidden="true" style="display: none; z-index: 1050;">
    	<div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 class="modal-title">Modal 1</h4>
            </div><div class="container"></div>
            <div class="modal-body">
  <input type="button" value="Search" onclick="execDaumPostcode()" class="btn-default-1 btn">
              Content for the dialog / modal goes here.
              <br>
              <br>
              <br>
              <p>more content</p>
              <br>
              <br>
              <br>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure temporibus reiciendis sapiente necessitatibus beatae aperiam animi expedita saepe reprehenderit quod enim quo nemo, delectus iste facilis nesciunt. Ab, beatae, laborum!</p>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
              <a data-toggle="modal" href="#myModal2" class="btn btn-primary">Launch modal</a>
            </div>
            <div class="modal-footer">
              <a href="#" data-dismiss="modal" class="btn">Close</a>
              <a href="#" class="btn btn-primary">Save changes</a>
            </div>
          </div>
        </div>
    </div>
    <!-- second modal -->
    <div class="modal" id="myModal2" aria-hidden="true" style="display: none; z-index: 1060;">
    	<div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 class="modal-title">Modal 2</h4>
            </div><div class="container"></div>
            <div class="modal-body">
              Content for the dialog / modal goes here.
              <br>
              <br>
              <p>come content</p>
              <br>
              <br>
              <br>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
              <a data-toggle="modal" href="#myModal3" class="btn btn-primary">Launch modal</a>
            </div>
            <div class="modal-footer">
              <a href="#" data-dismiss="modal" class="btn">Close</a>
              <a href="#" class="btn btn-primary">Save changes</a>
            </div>
          </div>
        </div>
    </div>
    <!-- third modal -->
    <div class="modal" id="myModal3" aria-hidden="true" style="display: none; z-index: 1070;">
    	<div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 class="modal-title">Modal 3</h4>
            </div><div class="container"></div>
            <div class="modal-body">
              Content for the dialog / modal goes here.
              <br>
              <br>
              <br>
              <br>
              <br>
              <a data-toggle="modal" href="#myModal4" class="btn btn-primary">Launch modal</a>
            </div>
            <div class="modal-footer">
              <a href="#" data-dismiss="modal" class="btn">Close</a>
              <a href="#" class="btn btn-primary">Save changes</a>
            </div>
          </div>
        </div>
    </div>
    <!-- 4th modal -->
    <div class="modal" id="myModal4" data-backdrop="static" aria-hidden="true" style="display: none; z-index: 1080;">
    	<div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 class="modal-title">Modal 4</h4>
            </div><div class="container"></div>
            <div class="modal-body">
              Content for the dialog / modal goes here.
            </div>
            <div class="modal-footer">
              <a href="#" data-dismiss="modal" class="btn">Close</a>
              <a href="#" class="btn btn-primary">Save changes</a>
            </div>
          </div>
        </div>
    </div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  </body>
  </html>