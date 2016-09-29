class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def create
    @job = Job.find(params[:job_id])
    @comment = @job.comments.build(comment_params)
    if  @comment.save
      flash[:notice] = "Comment was created with success..."
    else
      flash[:alert] = "Please fill in all fields to create a comment."
    end
      redirect_to @job
  end

  def destroy
    @comment.destroy
    redirect_to @comment.job, notice: "Comment destroyed with success"
  end

  private

  def set_comment
    id = params[:id]
    @comment = Comment.find(id)
  end

  def comment_params
    params.require(:comment).permit :name, :body, :job_id
  end
end
