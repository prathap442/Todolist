class TodoitemsController < ApplicationController
  def new 
    @todoitem = Todoitem.new
  end

  def index
    @todoitems = Todoitem.all
    respond_to do |format|
      format.html
      format.json
      format.js
    end	
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
    @todoitem = Todoitem.find(params[:id])
    if @todoitem.destroy
      flash[:message] = "the item was successfully destroyed";
    else 
      flash[:error] = "them item couldn\'t successfully be destroyed";
    end
    redirect_to @todolist	
  end

  def complete
    @todoitem = @todolist.todoitems.find(params[:id])
    @todoitem.update_attribute(completed_at: Time.now)
    redirect_to @todolist_id,notice: "the item was marked to be completed"
  end	


  private
  def set_todolist
    @todolist=Todolist.find(params[:todolist_id])
  end	
  def todoitem_params
    params[:todoitem].permit(:content,:todolist_id)
  end	
end
