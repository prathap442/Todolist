class TodoitemsController < ApplicationController
  before_action :set_todolist
  
  def new 
    @todoitem = Todoitem.new
  end

  def create 
  	set_todolist
  	@todoitem = @todolist.todoitems.create(todoitem_params)
  	redirect_to @todolist
  end

  def show 
    @todoitem = @todolist.todoitems.find(params[:id])
  end

  def destory
    @todoitem = @todolist.todoitems.find(params[:id])
    if @todoitem.destroy
      flash[:message] = "the item was successfully destroyed";
    else 
      flash[:error] = "them item couldn\'t successfully be destroyed";
    end
    redirect_to @todolist	
  end


  private
  def set_todolist
    @todolist=Todolist.find(params[:todolist_id])
  end	
  def todoitem_params
    params[:todoitem].permit(:content,:todolist_id)
  end	
end
