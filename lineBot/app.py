from flask import Flask, request
import json
import numpy as np
from linebot import (LineBotApi, WebhookHandler)
from linebot.models import (
 MessageEvent, TextMessage, TextSendMessage, ImageSendMessage,
 SourceUser, SourceGroup, SourceRoom,
 TemplateSendMessage, ConfirmTemplate, MessageTemplateAction,
 ButtonsTemplate, URITemplateAction, PostbackTemplateAction,
 CarouselTemplate, CarouselColumn, PostbackEvent,
 StickerMessage, StickerSendMessage, LocationMessage, LocationSendMessage,
 ImageMessage, VideoMessage, AudioMessage,
 UnfollowEvent, FollowEvent, JoinEvent, LeaveEvent, BeaconEvent, rich_menu
)
from package.nlp_function import *
from package.classifyText_function import *
import variable

app = Flask(__name__)

##long live token
Channel_access_token ='zcymAlBmiCjCSIXu8oXvV0lCy/VIPdDrH3d5lPVe+WxmvE5bL+xwVN42hg2/GauQ16W0QjgUm4zfkD/ibPurTQNsJtkGKKpytDD7A58I5OMrtOH3K95tcpaUyvQxqMjKbvwR3lgndlYhILyb1VjdlgdB04t89/1O/w1cDnyilFU='
line_bot_api = LineBotApi(Channel_access_token)


#function การดึงข้อมูลผู้ใช้
def get_user_name(user_id):
        profile = line_bot_api.get_profile(user_id).display_name
        return profile

#function การตอบกลับแบบจำแนกประเภท
def classify_text_type_and_reply(userId,msgTxt):
        ####USER chat ZONE####
        
        feedback, message_group, reply = classifySegment(split_text_ai(msgTxt))  #feedback คือสิ่งที่botจะตอบกลับ
        if(search_contacter(userId) == []): ## searching contacter if none just insert data
            insert_contacter(userId,get_user_name(userId))
            print("insert new contacter done.")
        insert_text_and_type(msgTxt, message_group, reply, userId,"contacter")      #push text from contacter to database
        
        ####USER chat ZONE####

        ####BOT chat ZONE####
        replyObj = TextSendMessage(text=feedback)
        line_bot_api.push_message(userId,replyObj)
        insert_text_and_type(feedback, None, None, userId)      #push text from contacter to database
        ####BOT chat ZONE####       

#function การตอบกลับตามคำถามย่อย
def reply_subQuestion(userId,msgTxt):
    if(msgTxt != "1"):
        replyObj = TextSendMessage(text="ตอบหน่อยเด๋")
    else:
        replyObj = TextSendMessage(text="ตาราง")
        variable.state  = "admin"

    line_bot_api.push_message(userId,replyObj)


#function การตอบกลับ
def event_handle(object):
    print(object)
    msgType = object['message']['type']
    userId = object['source']['userId']
    msgId = object['message']['id']
    msgTxt = object['message']['text']
    print(f"=======\nmsgTxt: {msgTxt}\nmsgType: {msgType}\nuserId: {userId}\n=======\n")

    if(msgType == "text"):
        if(variable.state == "admin"):
            print(">>in admin")
            classify_text_type_and_reply(userId,msgTxt)
            variable.state  = "contacter"
        elif(variable.state == "contacter"):
            print(">>in contact")
            reply_subQuestion(userId,msgTxt)
            
    else:
        replyObj = StickerSendMessage(sticker_id= '11825396', package_id= '6632')
        line_bot_api.push_message(userId,replyObj)
    return ''

#ต่อ webhook with ngrok at lineDev ไว้รอ user send msg มา
@app.route('/webhook',methods = ['POST'])
def callback():
    json_line = request.get_json(force=False)
    json_line = json.dumps(json_line)
    decoded = json.loads(json_line)
    event = len(decoded['events'])
    for i in range(event):
        object= decoded['events'][i]
        event_handle(object)
    return '',200

if __name__ == '__main__':
    app.run(port = 8080)

