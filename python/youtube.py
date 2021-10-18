import threading
import selenium
from sys import exit
from time import sleep
from selenium import common
from selenium.webdriver import Chrome;
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.options import Options;
from selenium.webdriver.support import expected_conditions as EC;
from selenium.webdriver.common.by import By;
from selenium.webdriver.support.ui import WebDriverWait;

class YoutubeMusic(threading.Thread):
    def __init__(self):
        threading.Thread.__init__(self);
        self.FirstTime = True;
        self.existingProj = False;
        self.IncreaseTime = 30;
        self.DecreaseTime = 30;
        self.user_agent = '--user-agent=Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) CriOS/56.0.2924.75 Mobile/14E5239e Safari/602.1'
        self.options = Options();
        self.CompletelyLoaded = True;
        self.options.add_argument(self.user_agent);
        self.options.add_argument('--headless');
        self.options.add_argument('--disable-extensions')
        self.options.add_argument('--log-level=3')
        self.chromedriverPath = r"C:\\Users\\hp\\AppData\\Local\\Programs\\Python\\Python38\\chromedriver.exe"; # change this with your actual chromedriver path.
        self.Browser = Chrome(self.chromedriverPath,options=self.options); 
        #our browser is read to shoot.
    def HelpMenu(self):
        ProgramBanner="""
        [>] Youtube Music Command Line Application.
        
        Written In Python, Using Selenium Framework.
        """
        self.FirstTime = False
        print(ProgramBanner);
    def NavigateYoutube(self,MusicName):
        #!t Will Navigate On Youtube Website.
        self.MusicName = MusicName;
        self.CompletelyLoaded = False
        print("[Loading %s On Youtube . . . ]"%self.MusicName);
        self.Browser.get("https://m.youtube.com/results?search_query=%s"%self.MusicName);
        self.Browser.implicitly_wait(5);
    def ListVideos(self):
        self.existingProj = True;
        self.Counter = 1;
        self.Videos = [];
        for eachVid in range(1,7):
            self.xpath = '//*[@id="app"]/div[1]/ytm-search/ytm-section-list-renderer/lazy-list/ytm-item-section-renderer/lazy-list/ytm-compact-video-renderer[%d]/div/div/a/h4'%eachVid;
            self.EachVideo = WebDriverWait(self.Browser,5).until(EC.presence_of_element_located((By.XPATH,self.xpath)))
            self.EachVideo=self.EachVideo.text;
            #self.EachVideo = self.Browser.find_element_by_xpath('/html/body/ytm-app/div[3]/ytm-search/ytm-section-list-renderer/lazy-list/ytm-item-section-renderer/lazy-list/ytm-compact-video-renderer[%d]/div/div/a/h4/span'%eachVid).text;
            self.Videos.append(self.EachVideo);
        for eachVid in self.Videos:
            print("[%d]: %s"%(self.Counter,eachVid));
            self.Counter += 1;
    def RefreshPage(self):
        #!In Case Of Error Refresh Can Be Done.
        self.CurrentPage = self.Browser.current_url;
        self.Browser.get(self.CurrentPage);
        print("Page Refreshed.")
    def PlayVideo(self,VideoID):
        #Finally Plays Video.
        #!VIDEO PLAY CODE HERE
        self.VideoPlay = '//*[@id="app"]/div[1]/ytm-search/ytm-section-list-renderer/lazy-list/ytm-item-section-renderer/lazy-list/ytm-compact-video-renderer[%d]/div/div/a/h4'%VideoID;
        self.Video = WebDriverWait(self.Browser,5).until(EC.presence_of_element_located((By.XPATH,self.VideoPlay)));
        sleep(2)
        self.Video.click()

        self.VideoTitle = WebDriverWait(self.Browser,5).until(EC.presence_of_element_located((By.CLASS_NAME,'slim-video-metadata-title')));
        #self.VideoTitle = self.Browser.find_element_by_class_name('slim-video-metadata-title'); #!To Fetch Video Title.
        self.VideoTitle = self.VideoTitle.text; 
        print('[Playing %s Youtube Now... ]'%self.VideoTitle);
        self.CompletelyLoaded = True;
        self.RefreshPage();
        self.GetUrl = self.Browser.find_element_by_css_selector('video.video-stream.html5-main-video');
        #self.GetUrl = WebDriverWait(self.Browser,30).until(EC.presence_of_all_elements_located((By.CSS_SELECTOR,'video.video-stream.html5-main-video')));
        self.GetUrl = self.GetUrl.get_attribute("currentSrc");
        self.Browser.get(self.GetUrl)
    def MoveForward(self):
        #!Time In Seconds. [ Default 30 Sec ]
        self.Browser.execute_script("document.getElementsByTagName('video')[0].currentTime += %s"%self.IncreaseTime)
    def MoveBackwards(self):
        #!Time In Seconds. [ Default : 30 Sec] 
        self.Browser.execute_script("document.getElementsByTagName('video')[0].currentTime += %s"%self.DecreaseTime)
    def RestartVideo(self):
        #!Restart Current Video.
        self.CurrentVideoUrl = self.GetUrl;
        self.Browser.get(self.CurrentVideoUrl);
        pass
    def Pause(self):
        self.Browser.execute_script("document.getElementsByTagName('video')[0].pause()");
        pass
    def Play(self):
        self.Browser.execute_script("document.getElementsByTagName('video')[0].play()");
        pass
    def Close(self):
        self.Browser.close();
        exit(1)
    def ThreadStatus(self):
        print(threading.enumerate())


x = YoutubeMusic();
while True:

	if x.FirstTime:
		x.HelpMenu();
	else:
		try:
			if x.existingProj == True:
				# if project is already running.
				contentchoice = int(input("[ Song Number / 98 For CMD / Press 99 For Backward ] : "))
				if contentchoice == 0:
					x.PlayVideo(1)

				if contentchoice == 98:

					print("""
					quit : to quit the program
					refresh : to refresh the song.
					play : To play paused song again.
					pause : To pause the song.
					forward(time) : To skip a song forward to 'n' minutes.
					backward(time) : To skip a song backward to 'n' minutes.
						""")
	
					cmd = input("[CMD] ");

					if cmd == "quit" or cmd == "QUIT":
						x.Close()
					elif cmd == "help" or cmd == "HELP" or cmd == "=?":
						x.HelpMenu()
					elif cmd == "refresh" or cmd == "REFRESH":
						x.RestartVideo()
					elif cmd == "play" or cmd == "PLAY":
						x.Play();
					elif cmd == "pause" or cmd == "PAUSE":
						x.Pause();
					elif "forward" in cmd or "FORWARD" in cmd:
						if ":" not in cmd:
							x.MoveForward();

						else:

							Ftime = cmd.split(":")[1];
							if(len(Ftime) == 0):
								x.MoveForward()
							else:
								x.IncreaseTime = Ftime;
								x.MoveForward()

					elif "backward" in cmd or "Backward" in cmd:
						if ":" not in cmd:
							x.MoveBackwards();

						else:

							x.DecreaseTime = Ftime;
							x.MoveBackwards()


				elif contentchoice == 99:
					x.existingProj = False;
					continue

				else:
					x.NavigateYoutube(contentName)
					x.PlayVideo(contentchoice);
			else:
				#no project prior running.
				contentName = input("\n [ Search Music By Name ] : ");

				if contentName:
					try:
						x.NavigateYoutube(contentName)
						x.ListVideos()

					except:
						pass

		except ValueError:
			pass
 

		except common.exceptions.ElementClickInterceptedException:
			print("Unknown Error - Please Try Again.")
			continue

		except common.exceptions.WebDriverException:
			print("Error while using Chrome Driver (Possible Causes ) : ");
			print("1. Using Old Chrome Driver, Please Get Latest Version.")
			print("2. Incorrect Path of Chrome Driver Provided, Please Correct It.")
			input();
			exit();