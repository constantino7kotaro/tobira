class MessagesController < ApplicationController
  def index
    @messages = [
      "今日からProgateでRailsの勉強するよー！",
      "投稿一覧ページ作成中！"
    ]
  end
end
