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
      test = Test.find(params[:test_id])
      
      
      if comment.destroy
        redirect_to test_path(@test), notice: 'コメントを削除しました'
      else
        flash.now[:alert] = 'コメント削除に失敗しました'
        render test_path(@test)
      end
    end

    
  
    private
    def comment_params
      params.permit(:content)
    end
    
end
