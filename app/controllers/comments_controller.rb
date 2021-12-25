class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
      test = Test.find(params[:test_id])
      comment = test.comments.build(comment_params) 
      comment.user_id = current_user.id
      if comment.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path)
      else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path)
      end
    end

    def destroy
      comment = Comment.find_by(test_id: params[:test_id], user_id: current_user.id)
      comment.destroy
      redirect_back(fallback_location: root_path)
     
        
    end

    
  
    private
    def comment_params
      params.require(:comment).permit(:content)
    end
    
end
