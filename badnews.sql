SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 200 (class 1259 OID 10544892)
-- Name: account; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.account (
    id integer NOT NULL,
    fullname character varying(30) NOT NULL,
    username character varying(15) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(6) NOT NULL
);


--
-- TOC entry 201 (class 1259 OID 10544895)
-- Name: account_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4043 (class 0 OID 0)
-- Dependencies: 201
-- Name: account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.account_id_seq OWNED BY public.account.id;


--
-- TOC entry 202 (class 1259 OID 10544897)
-- Name: article; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.article (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    image character varying(255) DEFAULT NULL::character varying,
    shortintro character varying(500) NOT NULL,
    content text NOT NULL,
    datecreated timestamp without time zone NOT NULL,
    accountid integer,
    categoryid integer
);


--
-- TOC entry 203 (class 1259 OID 10544904)
-- Name: article_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4044 (class 0 OID 0)
-- Dependencies: 203
-- Name: article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.article_id_seq OWNED BY public.article.id;


--
-- TOC entry 204 (class 1259 OID 10544906)
-- Name: article_tag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.article_tag (
    articleid integer NOT NULL,
    tagid integer NOT NULL
);


--
-- TOC entry 205 (class 1259 OID 10544909)
-- Name: category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 10544912)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4045 (class 0 OID 0)
-- Dependencies: 206
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 207 (class 1259 OID 10544914)
-- Name: comment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comment (
    id integer NOT NULL,
    content character varying(500) NOT NULL,
    datecreated timestamp without time zone NOT NULL,
    accountid integer,
    articleid integer
);


--
-- TOC entry 208 (class 1259 OID 10544920)
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4046 (class 0 OID 0)
-- Dependencies: 208
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;


--
-- TOC entry 209 (class 1259 OID 10544922)
-- Name: tag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tag (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 10544925)
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4047 (class 0 OID 0)
-- Dependencies: 210
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tag_id_seq OWNED BY public.tag.id;


--
-- TOC entry 3867 (class 2604 OID 10544927)
-- Name: account id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account ALTER COLUMN id SET DEFAULT nextval('public.account_id_seq'::regclass);


--
-- TOC entry 3869 (class 2604 OID 10544928)
-- Name: article id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.article ALTER COLUMN id SET DEFAULT nextval('public.article_id_seq'::regclass);


--
-- TOC entry 3870 (class 2604 OID 10544929)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3871 (class 2604 OID 10544930)
-- Name: comment id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);


--
-- TOC entry 3872 (class 2604 OID 10544931)
-- Name: tag id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag ALTER COLUMN id SET DEFAULT nextval('public.tag_id_seq'::regclass);


--
-- TOC entry 4027 (class 0 OID 10544892)
-- Dependencies: 200
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.account VALUES (1, 'Sandry Veclora', 'authoracc1', 'authoracc1', 'AUTHOR');
INSERT INTO public.account VALUES (2, 'Tom Kimnavec', 'authoracc2', 'authoracc2', 'AUTHOR');
INSERT INTO public.account VALUES (3, 'Kevin Ketchupo', 'authoracc3', 'authoracc3', 'AUTHOR');
INSERT INTO public.account VALUES (4, 'Gerald Takeover', 'authoracc4', 'authoracc4', 'AUTHOR');
INSERT INTO public.account VALUES (5, 'Julie Power', 'guestacc1', 'guestacc1', 'GUEST');
INSERT INTO public.account VALUES (6, 'Fecma Modizta', 'guestacc2', 'guestacc2', 'GUEST');
INSERT INTO public.account VALUES (7, 'Lê Hoàng Nam', 'testoff1', '$2a$10$/JyAH20/kPaA0avlIskBhuVuPjgjGeyWjAiSSySwLUiaaxyQ3N.wC', 'GUEST');
INSERT INTO public.account VALUES (8, 'ABCDEF', 'testacc2', '$2a$10$mM40HAzR8TBs/GNTdDIxiedBqoHtGIWczKx7z.FTpDA6X2aB5b/22', 'GUEST');
INSERT INTO public.account VALUES (9, 'hello', 'hieptv', '$2a$10$cPo6zBJyNAzIzSHBnHLp7.GmlJ4xkEKxOCbppmLGDLuLm0QrRki5O', 'GUEST');
INSERT INTO public.account VALUES (10, 'Co the xoa', 'test1', '$2a$10$wk5qMDZPMn9WvSqiWouOg.R/rqoAtVD73igNTVaNUfOaAhJPbhYJ2', 'GUEST');
INSERT INTO public.account VALUES (11, 'Co the xoa', 'test2', '$2a$10$JDLxsHzmX6NMy8F2suaXwuRF7H71vfDhX/eHfiJo87co7jg28XarK', 'GUEST');


--
-- TOC entry 4029 (class 0 OID 10544897)
-- Dependencies: 202
-- Data for Name: article; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.article VALUES (1, 'US lawmakers welcome India''s move to increase FDI in insurance sector to 74 per cent', 'https://img.etimg.com/thumb/msid-82113372,width-300,imgsize-27651,,resizemode-4,quality-100/insurance-bccl.jpg', '"We are very encouraged by the inclusion of a proposal to raise the limit on foreign direct investment in the Indian Insurance sector from 49 per cent to 74 per cent," Congressman Brad Sherman and Steve Chabot said.', 'Two influential US lawmakers have applauded the Indian government''s move to increase foreign direct investment in the insurance sector from the existing 49 per cent to 74 per cent, saying it will further deepen bilateral trade and investment.
India''s Parliament last month passed the Insurance Amendment Bill 2021 to increase the foreign direct investment (FDI) limit in the insurance sector.
"We are very encouraged by the inclusion of a proposal to raise the limit on foreign direct investment in the Indian Insurance sector from 49 per cent to 74 per cent," Congressman Brad Sherman and Steve Chabot said.
"This long-awaited reform holds the promise of expanding insurance coverage for Indian consumers and businesses, promoting both financial inclusion and economic resilience in India," they said.
Sherman is the Democratic Co-Chair of the House Caucus on India and Indian Americans. Chabot is the Republican Co-Chair of the Caucus.
In a letter to the Indian Ambassador to the US, Taranjit Singh Sandhu, the two lawmakers said that such a move proposed in the recent annual budget would also increase the availability of capital to support India''s ambitious infrastructure goals.
Finally, in addition to advancing Indian economic development, this reform would further deepen US-India trade and investment ties at a critical moment for bilateral relations.
"Considering these benefits, we urge you to take all available steps to ensure that this reform is expeditiously implemented law without requirements that would undermine its efficacy and its consistency with international norms," the two lawmakers said in their letter to Sandhu.
According to Berman and Chabot, given the opportunity to increase their investments in the Indian market, US insurers will be able to expand their offerings of innovative, competitively priced insurance products - serving existing demand and stimulating new demand - and thereby help improve Indian public safety, health, and security.
Berman and Chabot said the increased investment would also support India''s funding and maintenance of infrastructure that will boost India''s growth and development over the long term.
The reform would also eliminate a longstanding barrier in the bilateral economic relationship.
"A durable and mutually beneficial economic relationship requires reciprocity. Raising the limit on foreign direct investment in the insurance sector from 49 per cent to 74 per cent is an important step toward establishing reciprocity in the insurance sector between the United States and India, as the United States imposes no foreign equity limitations in this sector," they said.
"Taking this step now would signal to the US Congress and the Biden administration that India is willing to conquer historical barriers to increasing bilateral trade and investment," the two lawmakers wrote in the letter to Sandhu.', '2021-04-17 11:08:00', 1, 1);
INSERT INTO public.article VALUES (2, 'Protests erupt in US cities over police violence as riot declared in Portland', 'https://i.guim.co.uk/img/media/c5d05edc1c26254be4fb0a1d1c497fd4b9540f11/0_398_6000_3600/master/6000.jpg?width=445&quality=45&auto=format&fit=max&dpr=2&s=b02c0ca8f3f94185ea7a3af5344b7e87', 'Thousands marched in Chicago where 13-year-old Adam Toledo was killed while about 100 arrested in Brooklyn Center', 'After a heated week of police violence, protests erupted in several US cities on Friday, at times turning tense.
In the wake of the killings of Daunte Wright, a 20-year-old shot by police after being pulled over, and unarmed 13-year-old Adam Toledo, thousands took to the streets to demonstrate, sometimes into the night.
In Chicago, where Adam was killed, thousands marched in Logan Square after the video of the 13-year-old being shot with his arms raised was released this week. The protesters planned to march to Mayor Lori Lightfoot’s home, some of them calling for her resignation.
The event was largely peaceful, though some police and protesters scuffled as the night drew to a close.
In the Minneapolis, Minnesota suburb of Brooklyn Center, protesters staged the sixth straight night of demonstrations outside the police headquarters. Smaller demonstrations also occurred in downtown Minneapolis.
Authorities had initially declined to declare an evening curfew, after quieter protests on the previous two nights. But after clashes between protesters and police in Brooklyn Center, during which authorities claimed a fence around the heavily fortified police headquarters was breached, an unlawful assembly was declared and 100 arrests were made.
Earlier in the evening, a US district judge ruled that Minnesota state patrol could not arrest, threaten or target journalists after an ACLU complaint that law enforcement was unfairly cracking down on working reporters.
But on Friday night a number of reporters documented being detained by police and released only after being photographed by officers with their press identification badges.
Meanwhile, a protest that began peacefully in California ended with multiple fires set, several cars damaged and numerous windows shattered.
The protest against police brutality in Oakland began calmly Friday night, news outlets reported. A subsequent march drew about 300 people.
People in the crowd threw bottles and other objects at officers during the march, Oakland police said in a statement. One officer suffered an injury from being struck in the head. A community member was also assaulted, police said.
But later, authorities declared an unlawful assembly and instructed demonstrators to leave. Police said the protesters dispersed peacefully. There were no arrests or citations issued.
In Portland, Oregon, police declared a riot on Friday night after demonstrations that followed police fatally shooting a local man while responding to reports of a person with a gun.
Some witnesses said the man was mentally ill, but Portland’s new street response team – created after last year’s protests to respond to mental crises without armed police – was not called.
Chris Davis, deputy police chief, told reporters earlier in the day that a white man in his 30s was shot and killed by police officer Zachary Delong, who opened fire with a gun and weapons that fire non-lethal projectiles. The man was pronounced dead at the scene in Lents Park, which is in a leafy, residential neighborhood of the city.
Two officers fired a 40mm device that shoots non-lethal projectiles, and one officer – an eight-year veteran – fired a gun, police said in a statement. The officer is on paid administrative leave, and his or her name will be released Saturday, authorities said.
As investigators scoured the scene and documented evidence, nearly 100 yards (91 meters) away, a crowd of more than 150 people – many dressed in all black and some carrying helmets, goggles and gas masks – gathered behind crime scene tape, chanting and yelling at the officers standing in front of them.
As police began to finish on-scene investigation around 3pm the crowd marched through the park, ripped down police tape and stood face to face with officers dressed in riot gear. Police left the park around 3.30pm, and the crowd remained and eventually stood in a nearby intersection, blocking traffic and chanting.
Police said later Friday they had used pepper spray on protesters in order to disengage. Some people hit officers with sticks and chased officers as they were leaving, police said in a news release. Officers deployed smoke canisters and then used a rubber ball distraction device, police said.
The Portland mayor, Ted Wheeler, has decried what he described as a segment of violent agitators who detract from the message of police accountability and should be subject to more severe punishment.
“We’ve had to summon just about every police officer in Multnomah county to keep this group far enough away to preserve what we refer to in our business as the integrity of the scene, so that nobody who shouldn’t be in there goes in there,” Davis said, adding that deputies with county sheriff’s office were also helping.', '2021-04-17 14:27:00', 1, 10);
INSERT INTO public.article VALUES (3, 'Queen Elizabeth II Shares Never-Before-Seen Photo of Prince Philip Ahead of His Funeral', 'https://akns-images.eonline.com/eol_images/Entire_Site/2021317/rs_1024x820-210417070109-1024-Prince-Philip-Queen-Elizabeth.jpg', 'On the day before Prince Philip''s funeral, the royal family Instagram account posted a private photograph Queen Elizabeth II wished to share.', 'Queen Elizabeth II is giving a glimpse into her personal life with the late Prince Philip.
On April 16, the day before the Duke of Edinburgh''s funeral, the royal family''s Instagram account posted a private photograph that Her Majesty wished to share. The picture showed The Queen and Prince Philip smiling at the top of Scotland''s Coyles of Muick back in 2003. It was taken by Sophie, Countess of Wessex, the wife of the couple''s youngest child Prince Edward. 
"Her Majesty and the Royal Family are grateful for all the messages of condolence from around the world," the caption read, "and have been touched to see and hear so many people sharing fond memories of The Duke, in celebration of his life." 
Prince Philip and Queen Elizabeth II had been married for 73 years before he passed away at the age of 99 on April 9. They wed at Westminster Abbey in London on November 20, 1947. In fact, they became the first couple in the royal family to celebrate a platinum wedding anniversary in 2017.
In addition to being her husband, Prince Philip was a devoted consort (companion to the Sovereign) for nearly 70 years. He served from The Queen''s accession in 1952 up until his death. In fact, he became the longest-serving British consort in 2009. According to the royal family''s Instagram account, at Her Majesty''s 1953 coronation, he swore to be her "liege man of life and limb."
"He has quite simply been my strength and stay all these years," The Queen said in a 1997 speech to mark their golden anniversary, "and I, and his whole family, and this and many other countries, owe him a debt greater than he would ever claim, or we shall ever know."
Together, Queen Elizabeth II and Prince Philip welcomed four children: Prince Charles, Princess Anne, Prince Andrew and Prince Edward.
The Queen is one of 30 family members attending Prince Philip''s funeral at St. George''s Chapel in Windsor on Saturday, April 17. According to Buckingham Palace, the order of the service for the ceremonial funeral was agreed with Prince Philip during his lifetime and reflects the Duke of Edinburgh''s "close military affiliations and personal elements of His Royal Highness'' life."', '2021-04-17 09:06:00', 1, 2);
INSERT INTO public.article VALUES (4, 'Why our brains miss opportunities to improve through subtraction', 'https://www.sciencedaily.com/images/2021/04/210407135801_1_900x600.jpg', 'A new study explains why people rarely look at a situation, object or idea that needs improving -- in all kinds of contexts -- and think to remove something as a solution. Instead, we almost always add some element, whether it helps or not.', 'If, as the saying goes, less is more, why do we humans overdo so much?
In a new paper featured on the cover of Nature, University of Virginia researchers explain why people rarely look at a situation, object or idea that needs improving -- in all kinds of contexts -- and think to remove something as a solution. Instead, we almost always add some element, whether it helps or not.
The team''s findings suggest a fundamental reason that people struggle with overwhelming schedules, that institutions bog down in proliferating red tape, and, of particular interest to researchers, that humanity is exhausting the planet''s resources.
"It happens in engineering design, which is my main interest," said Leidy Klotz, Copenhaver Associate Professor in the Department of Engineering Systems and Environment. "But it also happens in writing, cooking and everything else -- just think about your own work and you will see it. The first thing that comes to our minds is, what can we add to make it better. Our paper shows we do this to our detriment, even when the only right answer is to subtract. Even with financial incentive, we still don''t think to take away."
Klotz, whose research explores the overlaps between engineering and behavioral science, teamed with three colleagues from the Batten School of Leadership and Public Policy on the interdisciplinary research that shows just how additive we are by nature. Batten public policy and psychology faculty, assistant professor Gabrielle Adams and associate professor Benjamin Converse, and former Batten postdoctoral fellow Andrew Hales, collaborated with Klotz on a series of observational studies and experiments to study the phenomenon.
When considering two broad possibilities for why people systematically default to addition -- either they generate ideas for both possibilities and disproportionately discard subtractive solutions or they overlook subtractive ideas altogether -- the researchers focused on the latter.
"Additive ideas come to mind quickly and easily, but subtractive ideas require more cognitive effort," Converse said. "Because people are often moving fast and working with the first ideas that come to mind, they end up accepting additive solutions without considering subtraction at all."
The researchers think there may be a self-reinforcing effect.
"The more often people rely on additive strategies, the more cognitively accessible they become," Adams said. "Over time, the habit of looking for additive ideas may get stronger and stronger, and in the long run, we end up missing out on many opportunities to improve the world by subtraction."
Klotz has a book that takes a wider view of the topic, Subtract: The Untapped Science of Less, coming out a week after the Nature paper. Although the timing is coincidence, both the paper and book are products of the interdisciplinary and collaborative research environment at UVA, he said.
"It''s an incredibly interesting finding, and I think our research has tremendous implications across contexts, but especially in engineering to improve how we design technology to benefit humanity," Klotz said.', '2021-04-07 15:00:00', 1, 3);
INSERT INTO public.article VALUES (5, 'Six key takeaways from Biden''s Russia sanctions announcement', 'https://cdn.cnn.com/cnnnext/dam/assets/201215031414-putin-biden-split-exlarge-169.jpg', 'The Biden administration slapped sweeping sanctions on Russia Thursday over Moscow''s alleged interference in the 2020 election, the massive SolarWinds hack and the ongoing occupation of Crimea, signaling it is adopting a tougher posture toward the Kremlin and Russian President Vladimir Putin.', 'Sanctions now align with the President''s rhetoric
The Trump administration was more than willing to issue sanctions against Russia, and did so on multiple occasions, including over the occupation of Crimea, the poisoning of an ex-spy in the United Kingdom, and even election interference.
But those actions were taken while Trump himself repeatedly refused to condemn Russia''s actions. He would not acknowledge Russia''s election interference in 2016, bristling at the notion Russia helped his campaign, even as his top national security officials unanimously said they agreed with the intelligence community assessment that Moscow interfered.
It went beyond the 2016 election, however. Last year, Trump declined to condemn Russia over the poisoning of Russian opposition leader Alexey Navalny. He and his top officials downplayed Russia''s meddling in the 2020 election, arguing China was a bigger threat -- a claim contradicted by last month''s intelligence community report on 2020 foreign election interference.
President Joe Biden has been vocal in his criticisms of Putin, calling him a "killer" last month and saying Moscow would "pay a price" for its election interference efforts. The sanctions issued Thursday back up that rhetoric.
Biden informed Putin in a call this week he was imposing the sanctions, and he''s seeking a "stable and predictable" relationship with Russia, a senior administration official said Thursday.
Sanctions are strongest US response to date to massive hack
The Russia sanctions are the Biden administration''s most significant step yet in responding to the SolarWinds hacking campaign, which has compromised at least nine federal agencies and dozens of private organizations.
Under Thursday''s new executive order, the administration imposed sanctions on six Russian tech companies that it said have supported Russian intelligence. Russian agencies including the FSB, GRU and SVR have conducted "some of the most dangerous and disruptive cyber attacks in recent history," the Treasury Department said in announcing the sanctions.
US intelligence agencies on Thursday issued a technical advisory warning of the tactics used by Russian agents to compromise network security.
The Biden administration also said it is exploring whether to invoke Trump''s executive order on technology supply chains to introduce additional policies aimed at preventing Russian cyberattacks in the future.
Russian hacking has long been a problem for the US government. The goal of Thursday''s sanctions is to deter Moscow, though it remains to be seen whether they will actually have that effect.
Flicking at collusion, all these years later
With one sentence in a 2,000-word press release, the Treasury Department perhaps did more to lay out the case for potential Trump-Russia collusion in the 2016 election than has happened before.
The Treasury statement confirmed that Konstantin Kilimnik, a Russian-linked intelligence operative, provided Russian intelligence with "with sensitive information on polling and campaign strategy." He got that inside information from Trump campaign officials.
While the sanctions issued Thursday were tied to Russia''s 2020 election interference efforts -- which the US says Kilimnik played a role in -- the reference to his meddling in 2016 is perhaps the bigger revelation.
It has long been suspected but never explicitly stated by the US government that Kilimnik passed internal Trump campaign data from former Trump campaign chairman Paul Manafort to Russian intelligence services. The announcement Thursday establishes a simple and direct channel of communication from the upper echelon of the Trump campaign to the Russian agencies that were meddling to help Trump win.
During the early stages of the Russia probe, officials from both parties said this kind of covert relationship between the Trump campaign and the Russians would constitute "collusion."
This revelation was a long time coming. It took years for special counsel Robert Mueller''s team to reveal that Manafort provided internal campaign information to Kilimnik. About a year later, the Senate Intelligence Committee openly called Kilimnik a Russian agent. But neither went so far as to say Kilimnik gave the information to the Russian government. Thursday''s announcement closes the loop.
After criticism of Trump, no action on Russian bounties
Then-candidate Biden repeatedly criticized Trump for failing to take action after being presented intelligence that Russia had placed bounties on US troops in Afghanistan.
On Thursday, a senior Biden administration official said the US intelligence community had only "low to moderate confidence" in the information about bounties, and said Biden was not taking action to punish Moscow on the issue.
The fact that Biden declined to issue sanctions over the bounties shows is yet another example of why governing is always more complicated than campaigning, particularly when it comes to foreign policy.
"Not only has he failed to sanction or impose any kind of consequences on Russia for this egregious violation of international law, Donald Trump has continued his embarrassing campaign of deference and debasing himself before Vladimir Putin," Biden said during a virtual town hall in June 2020.
In a first telephone call with Putin in January, Biden raised the issue of bounties. But three months later, his administration is stopping short of punishing Moscow based on an intelligence assessment that relied on detainee information that was collected in a "difficult operating environment" in Afghanistan.
"We have conveyed through diplomatic and intelligence channels strong direct messages on this issue," a senior administration official said, saying that if a pattern of behavior continues -- presumably with a greater degree of confidence -- the US would respond.
GOP knocks Biden for not issuing pipeline sanctions
Congressional Republicans praised the Biden administration for taking action against Russia, but they were critical that the sanctions announced Thursday did not include any action to try to prevent the completion of a natural gas pipeline between Russia and Germany known as Nord Stream 2.
"I commend the administration for these actions, but I consider them less than a half step forward. What is missing is a robust effort to actually stop the completion of the Nord Stream 2 pipeline," Sen. Jim Risch of Idaho, the top Republican on the Senate Foreign Relations Committee, said in a statement. "The lack of Nord Stream 2 sanctions today makes it even more obvious the administration, for unknown reasons, is foot-dragging on this issue."
Republicans have argued that the Biden administration must impose sanctions on entities involved in the pipeline''s construction under US law, but they have failed to do so. "If the Biden Administration is serious about imposing real costs on the Putin regime''s efforts to undermine U.S. democratic institutions and weaken our allies and partners, then it must ensure the Russian malign influence Nord Stream 2 pipeline project is never completed," House Foreign Affairs ranking Republican Michael McCaul of Texas said in a statement Thursday.
In an interview last month with CNN''s Dana Bash, Secretary of State Tony Blinken said he made clear to his German counterpart the US views the pipeline as a bad deal.
"It gives Russia more of a weapon using energy as a tool of coercion," he said.
Foreign policy -- and Russia -- will keep Biden''s attention
Since taking office in January, Biden has focused on getting a massive Covid-19 relief package signed into law, and now is turning his attention to passing a major infrastructure package through Congress.
But the sanctions are a reminder that foreign policy problems will always be looming and can snatch the focus of a presidency at a moment''s notice.
Blinken this week expressed concerns about Russia''s military buildup along the border with Ukraine, in what''s the largest massing of troops near Ukraine since 2014, when Russian forces invaded and occupied Crimea.
Thursday''s sanctions included punishing Russia for its ongoing occupation of Crimea, seven years later.
The senior administration official said Biden intends to hold a summit with Putin in Europe over the coming months but noted the Kremlin had not responded the US invitation.', '2021-04-15 17:20:00', 1, 4);
INSERT INTO public.article VALUES (6, 'A new book explores how military funding shaped the science of oceanography', 'https://www.sciencenews.org/wp-content/uploads/2021/04/041021_reveiows_science-on-a-Mission_feat-1380x776.jpg', 'In Science on a Mission, Naomi Oreskes argues that the U.S. Navy both enabled and stymied research', 'In 2004, Japanese scientists captured the first underwater images of a live giant squid, a near-mythical, deep-ocean creature whose only interactions with humans had been via fishing nets or beaches where the animals lay dead or dying.
Getting such a glimpse could have come much sooner. In 1965, marine scientist Frederick Aldrich had proposed studying these behemoths of the abyss using Alvin, a submersible funded by the U.S. Navy and operated by the Woods Hole Oceanographic Institution in Massachusetts. During the Cold War, however, studying sea life was not a top priority for the Navy, the main funder of U.S. marine research. Instead, the Navy urgently needed information about the terrain of its new theater of war and a thorough understanding of the medium through which submarines traveled.
In Science on a Mission, science historian Naomi Oreskes explores how naval funding revolutionized our understanding of earth and ocean science — especially plate tectonics and deep ocean circulation. She also investigates the repercussions of the military’s influence on what we still don’t know about the ocean.
The book begins just before World War II, when the influx of military dollars began. Oreskes describes how major science advances germinated and weaves those accounts with deeply researched stories of backstabbing colleagues, attempted coups at oceanographic institutions and daring deep-sea adventures. The story flows into the tumult of the 1970s, when naval funding began to dry up and scientists scrambled to find new backers. Oreskes ends with oceanography’s recent struggles to align its goals not with the military, but with climate science and marine biology.
Each chapter could stand alone, but the book is best consumed as a web of stories about a group of people (mostly men, Oreskes notes), each of whom played a role in the history of oceanography. Oreskes uses these stories to explore the question of what difference it makes who pays for science. “Many scientists would say none at all,” she writes. She argues otherwise, demonstrating that naval backing led scientists to view the ocean as the Navy did — as a place where men, machines and sound travel. This perspective led oceanographers to ask questions in the context of what the Navy needed to know.
One example Oreskes threads through the book is bathymetry. With the Navy’s support, scientists discovered seamounts and mapped mid-ocean ridges and trenches in detail. “The Navy did not care why there were ridges and escarpments; it simply needed to know, for navigational and other purposes, where they were,” she writes. But uncovering these features helped scientists move toward the idea that Earth’s outer layer is divided into discrete, moving tectonic plates (SN: 1/16/21, p. 16).
Through the lens of naval necessity, scientists also learned that deep ocean waters move and mix. That was the only way to explain the thermocline, a zone of rapidly decreasing temperature that separates warm surface waters from the frigid deep ocean, which affected naval sonar. Scientists knew that acoustic transmissions depend on water density, which, in the ocean, depends on temperature and salinity. What scientists discovered was that density differences coupled with Earth’s rotation drive deep ocean currents that take cold water to warm climes and vice versa, which in turn create the thermocline.
Unquestionably, naval funding illuminated physical aspects of the ocean. Yet many oceanographers failed to recognize that the ocean is also an “abode of life.” The Alvin’s inaugural years in the 1960s focused on salvage, acoustics research and other naval needs until other funding agencies stepped in. That switch facilitated startling discoveries of hydrothermal vents and gardens of life in the pitch black of the deep ocean.
As dependence on the Navy lessened, many Cold War scientists and their trainees struggled to reorient their research. For instance, their view of the ocean, largely driven by acoustics and ignorant of how sound affects marine life, led to public backlash against studies that could harm sea creatures.
“Every history of science is a history both of knowledge produced and of ignorance sustained,” Oreskes writes. “The impact of underwater sound on marine life,” she says, “was a domain of ignorance.”', '2021-04-16 11:02:00', 1, 5);
INSERT INTO public.article VALUES (7, 'DAMWON Gaming wins World Championship after defeating Suning 3-1', 'https://www.dailyesports.gg/wp-content/uploads/2020/10/ElqvnO7UYAAofbX-800x400.jpeg', 'DAMWON Gaming is crowned the 2020 League of Legends World Champions, eliminating Suning Gaming and bringing the Summoner’s Cup back home to South Korea. The intense match up showcased DAMWON’s determination and talent through some surprising performances, leading to the region’s 6th win. Although the finals took place in Suning’s home country of China, the team failed to continue their win streak from the past two years.', 'A win for DAMWON Gaming
Twenty-two international teams qualified to participate in this year’s World Championship. On Saturday morning, the series finally ended 3-1 as DAMWON accepted the title of the 2020 World Champions in front of 6,000 fans at the Pudong Stadium in Shanghai, China.
The South Korean top seed began today’s tournament with a leg up, winning the first match in 35 minutes. They earned 4 Drakes, 2 Barons, and 1 Elder, giving them a major advantage to Suning. Unfortunately, the LPL team couldn’t keep up with the gold difference. Moving on to the next game, Suning pushed forward and followed in DAMWON’s footsteps, reaching almost every objective as Suning’s top-laner Chen “Bin” Ze-Bin as Fiora dealing over 27 thousand points in damage. Overall, the final two games proved that DAMWON wouldn’t give up easily, with the last match ending quickly in 27 minutes.
Making the LCK proud
After the win, LCK teams congratulated DAMWON over the victory. The team recognized how important this milestone is, especially since the team started playing in Challengers Korea just 2 years ago. On the opposite end, Suning’s only tweet shared that they won’t be active on social media until next October.
DAMWON’s Worlds victory marks the first win in 3 years for the LCK. The last South Korean team to win the World Championship was Samsung Galaxy in 2017. SKT 1 followed right behind them, winning the Worlds Champions title from 2015 to 2016.
Unfortunately, Suning’s loss breaks the LPL’s win streak from 2018 to 2019. Regardless, their entire run from the start of Worlds to the end is a huge accomplishment for their region.', '2020-10-31 08:00:00', 1, 6);
INSERT INTO public.article VALUES (8, 'NASA Offers Stunning Pictures of Earth’s Natural Systems Taken From International Space Station', 'https://i.gadgets360cdn.com/large/Earth_Nasa_instagram_1618666727633.jpg', 'NASA posted the pictures of different parts of the world as seen from space on Instagram.', 'Social media users were in for a treat recently, thanks to the National Aeronautics and Space Administration (NASA)''s latest photos. The American space agency shared some exquisite images of Earth, giving us a look at the natural systems of the planet. The pictures were taken from the vantage point of the International Space Station (ISS) by NASA astronauts, the caption said. Sharing the pictures on Instagram, NASA wrote that the photos showed the natural systems of land, water, ice, and air “connecting to each other” to bring life on the planet. The caption read: “No matter whether we are on land or in space, we are unified by this tiny blue planet — and that''s something to celebrate.”
The first photo in the series is of Bombetoka Bay in Madagascar. An identical photo of the bay was posted by NASA in April, last year. Describing it, the caption read, “On the northwestern coast of Madagascar, the salty waters of the Mozambique Channel flow inland joining the freshwater outflow of the Betsiboka River, forming Bombetoka Bay...The sapphire water is tinged with pink where sediment is particularly thick, and dense vegetation adds a rich green pigment to the landscape.”
The second image was that of Richat Structure in Mauritania. Measuring about 40 km in diameter, the Richat Structure is one of the peculiar features of the Sahara desert and has been recognised and observed by astronauts from outer space for long.
This was followed by an image of the Everglades of South Florida. Everglades is a natural region of tropical wetlands, 20 percent of which is protected by the Everglades National Park. With its unique ecosystem, it has found its place as a UNESCO World Heritage Site, an International Biosphere Reserve, and a Wetland of International Importance.
The final photo in the series was that of the frozen Dnieper river in Europe. A blog post by NASA said that the image was captured by European Space Agency astronaut Thomas Pesquet, from ISS on February 9, 2017. About the photo, Thomas said, "Winter landscapes are also magical from the International Space Station: this river north of Kiev reminds me of a Hokusai painting."
Instagram users were extremely impressed with the photographs and left appreciative messages in the comment section. One user wrote, “NASA speaking truths as always!”
Another comment read, “Amazing, stunning pictures. Thanks for sharing, as a reminder for us...how beautiful is Earth.”
Tell us your thoughts on the photos.', '2021-04-17 17:45:00', 1, 7);
INSERT INTO public.article VALUES (9, 'Kenya Tourism Board takes fresh European representation', 'https://www.breakingtravelnews.com/images/sized/images/uploads/tourism/Balloon_Safari_-_Kenya_-_NS_2021-700x467.jpg', 'As part of preparations to welcome back travellers, the Kenya Tourism Board (KTB) has partnered with the PC Agency to represent the board in the UK and Ireland, Germany, Italy and France.', 'As part of preparations to welcome back travellers, the Kenya Tourism Board (KTB) has partnered with the PC Agency to represent the board in the UK and Ireland, Germany, Italy and France.
The PC Agency is a UK member of the global Travel Lifestyle Network, which includes member agencies Group Expression in France; KPRN in Germany and PR & GO UP in Italy.
The organisations will team up to promote Kenya as markets open for tourists post the Covid-19 pandemic.
Commenting on the partnership Kenya Tourism Board chief executive, Betty Radier, said that the collaboration would help the board to share destination material with news outlets and other platforms in the UK and other parts of Europe as well as engage the trade as Kenya continues to position itself as a key travel destination.
“I welcome this partnership with The PC Agency, they have done tremendous work in showcasing and marketing destinations across the world.
“We shall tap into their network to enable us to reach even more tourists from Europe’s top source markets as we plan for the recovery of the industry.
“The tourism industry has been severely affected by the Covid-19 pandemic, of importance is to remain ready for visitors once travel resumes fully,” said Radier.
Magical Kenya is known for its safari offering, found in over 45 national parks and game reserves across Kenya including the world famous Maasai Mara which offers the wildebeest migration spectacle.
The destination is also known for its white, pristine beaches at the Kenyan coast, adventure experiences and the Magical Kenya Signature experiences which demonstrate the Magic of Kenya.
A popular destination with direct British Airways and Kenya Airways flights, and indirect flights with Qatar Airways, Emirates, Etihad, Turkish Airlines among others, about 120,000 British visitors choose to experience Kenya each year, making the UK a key source market for Kenya.
The account team will be led by Katie Moine, chief operating officer at the PC Agency and Sophie Holloway, trade representation account director.', '2021-04-16 14:00:00', 1, 8);
INSERT INTO public.article VALUES (10, 'Virtual hoodie sells for £19,000 as a non-fungible token', 'https://i.guim.co.uk/img/media/460e6dc0e1a1f327c629d3647752f993f9cc04d5/349_234_759_455/master/759.jpg?width=445&quality=45&auto=format&fit=max&dpr=2&s=2b5ffcfd486947dd12cb463b63467425', 'Black hoodie from streetwear label Overpriced is part of growing NFT one-of-a-kind asset trend', 'A virtual hoodie has sold for £19,000, bought as a non-fungible token (NFT).
The black hoodie from the streetwear fashion label Overpriced, emblazoned with an expletive-laden logo in neon green graffiti font, sold on the digital art marketplace Blockparty.co to an anonymous bidder who, through scanning a code, can now “wear” the garment in virtual settings online.
It follows the virtual shoe brand RTFKT Studios’ recent collaboration with the “crypto artists” Fewocious to create a range of virtual footwear, which sold for £2.2m, selling out in seven minutes.
NFTs are one-of-a-kind assets that can take the form of anything digital and can be traded for something else, whether that is cryptocurrency or another piece of digital kit.
Overpriced describes itself as a brand which creates “fashion for the crypto generation”. Its co-founder Leighton James told Hypebeast: “We are a group of artists looking to create art-powered crypto fashion that aims to challenge the conceptions of what luxury fashion is.”
Last week, the art collective MITNFT, announced a series of NFTs featuring the supermodel Kate Moss. Three artworks – Drive with Kate, Walk with Kate and Sleep with Kate – which, according to Vogue, were shot at her home and sold as a limited edition of one, authenticated by Moss herself.
The Italian designer Angelo Galasso has produced a range of NFT wallets, backpacks and keychains, in collaboration with the artist Lee Robinson.
“NFTs provide a unique way for artists to designate what is real and what is authentic,” said James. “Our customers are purchasing unique wearable art that no one else in the world has.” The Overpriced hoodie can also be worn physically in the real world.
Last month Gucci created the Virtual 25 – a pair of virtual neon green and pink trainers made to be worn in virtual, augmented reality worlds. Robert Triefus, of Gucci’s brand and customer engagement department, told Vogue Business it was “only a matter of time” before it released an NFT.
The speculative market around one-of-a-kind NFTs has been enjoying a boom. The Kings of Leon became the first band to release an album in an NFT format, Grimes has amassed about £4m for sales of digital art in the format, while the Twitter chief executive, Jack Dorsey, sold his first tweet for more than £2m.', '2021-04-15 13:43:00', 1, 9);
INSERT INTO public.article VALUES (11, 'Biden administration is planning for possible Covid vaccine booster shots', 'https://image.cnbcfm.com/api/v1/image/106864328-16177347082021-04-06t183844z_759731341_rc2iqm96dqix_rtrmadp_0_usa-biden.jpeg', 'The Biden administration is preparing for the potential need for Covid-19 vaccine booster shots, though nothing is certain, a top U.S. official said Friday.', '“Requiring additional shots in the future is obviously a foreseeable potential event,” Andy Slavitt, senior advisor to President Joe Biden’s Covid response team, told reporters during a press briefing Friday. “I want to emphasize that while there is certainly speculation about this, that is far from saying that is what’s going to happen.”
Should Americans require booster shots, the U.S. government would likely need to make arrangements with the drugmakers to supply additional doses and make plans for vaccine distribution.
Slavitt said Friday the administration has thought about the need to secure additional doses.
“I can assure you that when we do our planning, when the president orders purchases of additional vaccines as he has done and when we focus on all the production expansion opportunities that we talk about in here we very much have scenarios like that in mind,” he said.
Pfizer CEO Albert Bourla, in comments that were aired for the first time Thursday, said people will likely need a third dose, or booster shot, of a Covid-19 vaccine within 12 months of getting fully vaccinated. Bourla also said it’s possible people will need to get vaccinated against the coronavirus annually, like for the seasonal flu.
“A likely scenario is that there will be likely a need for a third dose, somewhere between six and 12 months, and then from there, there will be an annual revaccination, but all of that needs to be confirmed. And again, the variants will play a key role,” he told CNBC’s Bertha Coombs during an event with CVS Health.
“It is extremely important to suppress the pool of people that can be susceptible to the virus,” he added.
Pfizer and Moderna have both said their two-dose Covid-19 vaccines, which use similar technology, remain highly effective six months after the second dose. However, researchers still don’t know how long protection against the virus lasts after six months of being fully vaccinated, though health experts do expect protection to wane after some time.
On Thursday, the Biden administration’s Covid response chief science officer, David Kessler, said Americans should expect to receive booster shots to protect against coronavirus variants. He told U.S. lawmakers that currently authorized vaccines are highly protective but noted new variants could “challenge” the effectiveness of the shots.
“We don’t know everything at this moment,” he told the House Select Subcommittee on the Coronavirus Crisis.
“We are studying the durability of the antibody response,” he said. “It seems strong, but there is some waning of that, and no doubt the variants challenge ... they make these vaccines work harder. So I think for planning purposes, planning purposes only, I think we should expect that we may have to boost.”
Moderna CEO Stephane Bancel told CNBC on Wednesday that the company hopes to have a booster shot for its two-dose vaccine available in the fall.', '2021-05-16 12:53:00', 2, 1);
INSERT INTO public.article VALUES (12, 'U.S. General: Iran Plotting Retaliatory Attacks on Americans in Africa', 'https://www.usnews.com/dims4/USNEWS/5ea7ff9/2147483647/thumbnail/970x647/quality/85/?url=http%3A%2F%2Fmedia.beam.usnews.com%2F7a%2F6b%2F6928233f4860a4f392261ec29d7d%2F200130newsafrica-editorial.jpg', 'Iran is planning to mobilize loyal forces to attack U.S. interests as revenge for the Jan. 3 killing of Qassem Soleimani, officials say.', 'Iran is planning attacks against Americans in Africa in retaliation for the Jan. 3 drone strike President Donald Trump ordered to kill the influential Iranian Gen. Qassem Soleimani, the top officer for U.S. operations there said Thursday.
"There''s intelligence reporting that comports with that," Army Gen. Stephen Townsend, head of U.S. Africa Command, told the Senate Armed Services Committee on Thursday morning.
Townsend, who formerly oversaw the war against the Islamic State group, told the committee that Iran appears to be mobilizing its elite Quds Force – the overseas wing of its zealous Islamic Revolutionary Guards Corps – and Hezbollah, Lebanon''s potent militant political movement that Soleimani helped establish and which still receives significant support from Tehran, to attack Americans.
The threat Iran poses has not become specific enough for Africa Command, also known as AFRICOM, to change any of its current activities, Townsend said, but he added, "we are watching and listening for that."
The news comes at a time of heightened concern for U.S. forces deployed to the Middle East and to Africa, following Iran''s retalitatory Jan. 7 ballistic missile strike against U.S. bases in Iraq. The Defense Department had already bolstered its protective forces in the region – including increased Navy ship deployments and 15,000 new troops last year – as a result of the Trump administration''s "maximum pressure campaign" designed to squeeze Tehran economically and diplomatically, and following Soleimani''s killing, through military action.
Townsend''s assessment also follows the surprise and troubling attack earlier this month by local insurgents against a little-known U.S. air base in Manda Bay, Kenya, near the Somali border. The militants overran the base and killed three Americans, prompting Townsend''s command to deploy 120 infantrymen from the 101st Airborne Division to restore security there. The base is currently under review for further security improvements.
The AFRICOM commander, who testified alongside U.S. Southern Command chief Navy Adm. Craig Faller, must address the new security concerns while also facing the prospect of sharp reductions from the roughly 5,000 U.S. forces – largely special operations troops – and 1,000 civilians and contractors currently operating in his area of responsibility as the Trump administration considers redeploying its limited resources to counter what it considers more grave threats posed by China and Russia.
"We''re not going to totally withdraw forces from Africa," Defense Secretary Mark Esper told reporters in a briefing on Thursday. Such a statement would usually be obvious, though concerns remain that a president who suddenly ordered the withdrawal of all U.S. forces from Syria and Iraq may make a similar decision for operations on a continent that notoriously receives less attention in Washington than those in the Middle East or against global powers. U.S. military leaders have found ways to maintain smaller footprints of forces in those countries despite the president''s initial orders.
The increased threats against U.S. forces in places like Somalia and Niger – the site of an ambush by an affiliate of the Islamic State group that killed four American troops in 2017 – combined with the fact that their missions are broadly based on counterterror operations and bolstering local militaries would likely come under particular scrutiny for Trump, who has prioritized domestic American interests over expensive and, at times, deadly foreign adventures.
In an appeal on Thursday, Townsend stressed the economic stability that accompanies a U.S. presence as well as the complex security problems that face the U.S. in Africa, particularly the recent Russian and Chinese interest in the continent and the need to prevent existing allies from turning to other partners.
He found some support from the dais. Sen. Jack Reed of Rhode Island, the committee''s top Democrat, said that countries in Africa like in South America are "beset by a vicious cycle of challenges that our competitors are seeking to leverage to their benefit. Countries with weak democratic institutions and rampant corruption are being overtly wooed by Chinese and Russian investments and covertly manipulated through information operations and a flood of disinformation."
Katherine Zimmerman, a resident fellow at the American Enterprise Institute, says Townsend''s command "does a lot on the continent with little," but that it will likely have to accept more responsibility with fewer resources.
"The shift of U.S. resources from Africa to support great power competition misses, as Gen. Townsend notes, that the continued U.S. engagements in Africa are great-power competition. The U.S. is losing the competition in Africa against China, Russia, al-Qaida, and the Islamic State [group]. It''s not losing militarily, but in the soft-power space," Zimmerman said in an email.
China has more embassies than the U.S. on the continent and seeks to exert influence by allowing African governments to come into its debt. Russia has increased its presence in the southern Mediterranean and coastlines, Zimmerman said.
"U.S. diplomacy and development dollars would go far in securing American interests in Africa. Yet it cannot win in the soft power competition without the hard power presence because of the very real security concerns," she said.', '2021-05-17 12:08:05.15', 2, 10);
INSERT INTO public.article VALUES (13, 'Blackpink’s Rose reveals the 1 thing she must do before performing onstage', 'https://www.channelnewsasia.com/image/13278726/1x1/600/600/96729ef804dad3999da48558b96e7c7/Od/rose-blackpink--light-up-the-sky-press-conference.jpg', 'Rose from K-pop girl group Blackpink revealed that there’s one thing she has to do before going onstage to perform – and that’s eating a Korean meal that includes rice.', 'The singer, who just released her solo album R on Friday (Mar 12), appeared on Korean variety show My Ugly Duckling on Sunday where she dished on that, as well as other aspects of her solo work.
Rose shared that she always has to eat rice in order to have enough energy to perform an entire concert. She said, “I always need to eat a traditional Korean meal that includes rice before I go onstage. It’s really strange, but if I don’t eat rice, I won’t be able to make it until the end of the concert. My arms will get all limp like seaweed”.
When asked by the host if other cuisines worked, Rose replied that they don''t. “I’ve tried other things, like eating bread. Nothing else worked”.
Rose also shared that despite having to deal with some cons while promoting her solo album – namely, not having her Blackpink friends to rely on – there are some pros, too.
“Now that I’m getting ready on my own, it takes less time to get ready. So I can wake up a little later,” she said.', '2021-04-15 00:00:00.15', 2, 2);
INSERT INTO public.article VALUES (14, 'Human cells grown in monkey embryos spark ethical debate', 'https://ichef.bbci.co.uk/news/976/cpsprodpb/15209/production/_118073568_human-monkeyblastocyst_weizhijikunminguniversityofscienceandtechnology.jpg', 'Monkey embryos containing human cells have been made in a laboratory, a study has confirmed.', 'Monkey embryos containing human cells have been produced in a laboratory, a study has confirmed, spurring fresh debate into the ethics of such experiments.
The embryos are known as chimeras, organisms whose cells come from two or more “individuals”, and in this case, different species: a long-tailed macaque and a human.
In recent years researchers have produced pig embryos and sheep embryos that contain human cells – research they say is important as it could one day allow them to grow human organs inside other animals, increasing the number of organs available for transplant.
Now scientists have confirmed they have produced macaque embryos that contain human cells, revealing the cells could survive and even multiply.
In addition, the researchers, led by Prof Juan Carlos Izpisua Belmonte from the Salk Institute in the US, said the results offer new insight into communications pathways between cells of different species: work that could help them with their efforts to make chimeras with species that are less closely related to our own.
“These results may help to better understand early human development and primate evolution and develop effective strategies to improve human chimerism in evolutionarily distant species,” the authors wrote.
The study confirms rumours reported in the Spanish newspaper El País in 2019 that a team of researchers led by Belmonte had produced monkey-human chimeras. The word chimera comes from a beast in Greek mythology that was said to be part lion, part goat and part snake.
The study, published in the journal Cell, reveals how the scientists took specific human foetal cells called fibroblasts and reprogrammed them to become stem cells. These were then introduced into 132 embryos of long-tailed macaques, six days after fertilisation.
“Twenty-five human cells were injected and on average we observed around 4% of human cells in the monkey epiblast,” said Dr Jun Wu, a co-author of the research now at the University of Texas Southwestern Medical Center.
The embryos were allowed to develop in petri dishes and were terminated 19 days after the stem cells were injected. In order to check whether the embryos contained human cells, the team engineered the human stem cells to produce a fluorescent protein.
Among other findings, the results reveal all 132 embryos contained human cells on day seven after fertilisation, although as they developed, the proportion containing human cells fell over time.
“We demonstrated that the human stem cells survived and generated additional cells, as would happen normally as primate embryos develop and form the layers of cells that eventually lead to all of an animal’s organs,” Belmonte said.
The team also reported that they found some differences in cell-cell interactions between human and monkey cells within chimeric embryos, compared with embryos of the monkeys without human cells.
Wu said they hoped the research would help develop “transplantable human tissues and organs in pigs to help overcome the shortages of donor organs worldwide”.
Prof Robin Lovell-Badge, a developmental biologist from the Francis Crick Institute in London, said at the time of the El País report he was not concerned about the ethics of the experiment, noting the team had only produced a ball of cells. But he noted conundrums could arise in the future should the embryos be allowed to develop further.
While not the first attempt at making human-monkey chimeras – another group reported such experiments last year – the new study has reignited such concerns. Prof Julian Savulescu, the director of the Oxford Uehiro Centre for Practical Ethics and co-director of the Wellcome Centre for Ethics and Humanities at the University of Oxford, said the research had opened a Pandora’s box to human-nonhuman chimeras
“These embryos were destroyed at 20 days of development but it is only a matter of time before human-nonhuman chimeras are successfully developed, perhaps as a source of organs for humans,” he said, adding that a key ethical question is over the moral status of such creatures.
“Before any experiments are performed on live-born chimeras, or their organs extracted, it is essential that their mental capacities and lives are properly assessed. What looks like a nonhuman animal may mentally be close to a human,” he said. “We will need new ways to understand animals, their mental lives and relationships before they are used for human benefit.”
Others raised concerns about the quality of the study. Dr Alfonso Martinez Arias, an affiliated lecturer in the department of genetics at the University of Cambridge, said: “I do not think that the conclusions are backed up by solid data. The results, in so far as they can be interpreted, show that these chimeras do not work and that all experimental animals are very sick.
“Importantly, there are many systems based on human embryonic stem cells to study human development that are ethically acceptable and in the end, we shall use this rather than chimeras of the kind suggested here.”', '2021-05-17 12:08:05.15', 2, 3);
INSERT INTO public.article VALUES (15, 'Government sets out tasks for new term', 'https://image.vietnamnews.vn/uploadvnnews/Article/2021/4/15/147738_3877310796245182_vna_potal_thu_tuong_pham_minh_chinh_chu_tri_hop_trien_khai_nhiem_vu_cua_chinh_phu_5389426.jpg', 'Prime Minister Phạm Minh Chính chairs a Government meeting for the first time on Thursday', 'HÀ NỘI – Prime Minister Phạm Minh Chính chaired a Government meeting on Thursday, the first Government meeting since new Cabinet members were elected early this month, to set out tasks for the new term.
During the day-long event, participants discussed the Government’s action plan to implement the resolution of the 13th National Party Congress, the Government’s working regulations, the disbursement of public investment, COVID-19 prevention and control, and the vaccination programme.
The preparations for the elections of deputies to the 15th National Assembly and all-level People’s Councils for 2021-26, along with the organisation of the national high school examinations, were also under consideration.
Given the context of the COVID-19 pandemic that affected the national growth rate in the first quarter (only 4.48 per cent), Prime Minister Chính said the workload of the new cabinet was very difficult and the Government would start its work immediately.
He called for solidarity and building a transparent Government with discipline and drastic actions. The people and businesses are regarded as the core of the Government’s activities to ensure every person enjoys social advances and equality.
He urged every cabinet member to make efforts to strongly take action and work effectively.
“Every cabinet member must set themselves as examples and be humble and willing to listen to various sides,” he told the meeting.
According to the Prime Minister, the Government will strengthen decentralisation and uphold the responsibilities of collectives and individuals. It looks to maintain an environment of stable peace and extensive international integration for development. The Government’s activities will follow resolutions of the Party, National Assembly and Government and the Government will work closely with mass organisations to mobilise national power.
The PM asked ministries and sectors, especially heads of ministries and sectors, to take full responsibility for public investment disbursement. The Ministry of Planning and Investment must review the disbursement and propose solutions to disburse investment at a high rate and in an effective manner.
The health ministry has been ordered to study and finalise the proposal on vaccine passports and create mechanisms to facilitate organisations and businesses to be qualified to buy vaccines.
Regarding preparations for the election of deputies to the 15th National Assembly and people''s councils for the 2021-26 tenure in May, Chính asked relevant agencies and local authorities to step up inspection and ensure public safety and order. — VNS', '2021-05-17 12:08:05.15', 2, 4);
INSERT INTO public.article VALUES (16, 'Earth sweeps up 5,200 tons of extraterrestrial dust each year', 'https://www.sciencenews.org/wp-content/uploads/2021/04/041321_sp_space-dust_feat.jpg', 'Those micrometeorites come from both comets and asteroids', 'As our planet orbits the sun, it swoops through clouds of extraterrestrial dust — and several thousand metric tons of that material actually reaches Earth’s surface every year, new research suggests.
During three summers in Antarctica over the past two decades, researchers collected more than 2,000 micrometeorites from three snow pits that they’d dug. Extrapolating from this meager sample to the rest of the world, tiny pebbles from space account for a whopping 5,200 metric tons of weight gain each year, researchers report in the April 15 Earth and Planetary Science Letters.
Much of Antarctica is the perfect repository for micrometeorites because there’s no liquid water to dissolve or otherwise destroy them, says Jean Duprat, a cosmochemist at Sorbonne University in Paris (SN: 5/29/20). Nevertheless, collecting the samples was no easy chore.
First, Duprat and colleagues had to dig down two meters or more to reach layers of snow deposited before 1995, the year when researchers set up a field station at an inland site dubbed Dome C. Then they used ultraclean tools to collect hundreds of kilograms of snow, melt it and sieve the tiny treasures from the frigid water.
In all, the team found 808 spherules that had partially melted as they blazed through Earth’s atmosphere and another 1,280 micrometeorites that showed no such damage. The particles ranged in size from 30 to 350 micrometers across and all together weigh mere fractions of a gram. But the micrometeorites were all found within three areas totaling just a few square meters, the merest fraction of Earth’s surface. Assuming that particles of space dust are just as likely to fall in Antarctica as anywhere else let the team estimate how much dust fell over the entire planet.
The team’s findings “are a wonderful complement to previous studies,” says Susan Taylor, a geologist at the Cold Regions Research and Engineering Laboratory in Hanover, N.H., who was not involved in the new study. That’s because Duprat and colleagues found a lot of the small stuff that would have dissolved elsewhere, she notes.
About 80 percent of the micrometeorites originate from comets that spend much of their orbits closer to the sun than Jupiter, the researchers estimate. Much of the rest probably derive from collisions of objects in the asteroid belt. All together, these tiny particles deliver somewhere between 20 and 100 metric tons of carbon to Earth each year, Duprat and colleagues suggest, and could have been an important source of carbon-rich compounds such as amino acids early in Earth’s history (SN: 12/4/20).', '2021-05-17 12:08:05.15', 2, 5);
INSERT INTO public.article VALUES (17, 'Astralis releases statement regarding Promisq’s recent online toxicity issues', 'https://cdn1.dotesports.com/wp-content/uploads/2019/06/11090223/47336179342_6fa666e7ba_k.jpg', 'A handful of players have shown screengrabs of the 27-year-old''s comments in-game', 'Astralis released a statement today after several screengrabs surfaced online regarding the in-game behavior of veteran support Promisq. The League of Legends team said it condemns such actions and will be “handling the matter internally” with Promisq.
Promisq’s behavior became a big topic of discussion yesterday when a high Elo player posted screengrabs of the 27-year-old threatening to intentionally feed if he didn’t pick a certain champion in a solo queue game. Afterward, Promisq added the player and said “hope you get cancer.”
On social media, multiple other people came forward to show proof of Promisq’s behavior in-game, including Cloud9 strategic coach Veigar v2. In his game, Promisq allegedly asked Veigar v2 “how hard [he] got dropped as a child.”
Toxicity has always been a huge issue in League. But it’s arguably even worse to see pros being overtly toxic since they’re supposed to represent their respective league and the best that the scene has to offer.
After spending the 2020 season in the Prime League with mousesports, Promisq was given another shot in the LEC with Astralis after the team rebranded from Origen and rebuilt its roster. He was set to compete alongside known European talent like Nukeduck, Jesklaa, and WhiteKnight, but not many people had high hopes for the team.
Astralis struggled to find any success in the 2021 LEC Spring Split, finishing in ninth place with a 6-12 record. Promisq also had a disappointing performance with the second-most deaths and tied for the second-lowest KDA in the league, according to Oracle’s Elixir.', '2021-05-17 12:08:05.15', 2, 6);
INSERT INTO public.article VALUES (18, 'Researchers create whitest paint, the Vantablack of white paints', 'https://www.cnet.com/a/img/VZZrh9hyAAyQiqrch2k36dVhOzI=/2021/04/16/58d94c96-690e-4468-b73b-2d6ed909a9b1/purdeuwhitestwhite.jpg', 'The engineers hope the supercool paint will reduce the need for air conditioning on a warming planet.', 'Last year, a Purdue University team unveiled a superwhite radiative cooling paint they said could basically create "free air conditioning" for houses and buildings. They''ve now developed an even whiter and cooler paint, one-upping their previous effort. 
"The researchers believe that this white may be the closest equivalent of the blackest black, ''Vantablack,'' which absorbs up to 99.9% of visible light," Purdue said in a statement Thursday. The white paint reflects up to 98.1% of sunlight, an improvement on the previous version''s 95.5%.
Ultrablack coatings and paints like Vantablack and MIT''s carbon-nanotube material (which doesn''t have a catchy name) are finding uses in telescopes, on wristwatches and for art projects.
The research team has a very specific purpose in mind for its new whitest-white paint: helping people chill out. It could be used on buildings and houses to reduce the need for air conditioning and conserve energy. Purdue calls the paint "the coolest on record."  
Surfaces painted with this whitest-white stay cooler than their surroundings, both under sunlight and at night, and it works in warm and cold conditions. "During an outdoor test with an ambient temperature of 43 degrees Fahrenheit, the paint still managed to lower the sample temperature by 18 degrees Fahrenheit," said Purdue.
The previous extremely white paint was made with calcium carbonate (a compound found in chalk), but the recipe for this new paint uses barium sulfate particles (found in some cosmetics). 
"A high concentration of particles that are also different sizes gives the paint the broadest spectral scattering, which contributes to the highest reflectance," said Purdue doctoral student Joseph Peoples, co-author of a paper published Thursday in the ACS Applied Materials & Interfaces journal.', '2021-05-17 12:08:05.15', 2, 7);
INSERT INTO public.article VALUES (19, 'Discovering Thẳm Phầy mysterious cave in Bắc Kạn', 'https://image.vietnamnews.vn/uploadvnnews/Article/2021/1/14/133148_tpcv.jpg', 'Located in the vast forest of Ba Bể District, Bắc Kạn Province, Thẳm Phầy Cave in Nà Slải Village, Hoàng Trĩ Commune beckons adventurous travellers to conquer its pristine and mysterious beauty.', 'Located in the vast forest of Ba Bể District, Bắc Kạn Province, Thẳm Phầy Cave in Nà Slải Village, Hoàng Trĩ Commune beckons adventurous travellers to conquer its pristine and mysterious beauty.
Stopping on the concrete road connecting the villages, we walked to the only path along the mountainside to explore the cave.
The sudden rain made the path slippery, a bit more dangerous than usual when walking on a variety of terrain. We crossed through terraced fields, springs, bamboo bridges and thick bushes to reach the cave.
The two kilometres of weaving in the forest made us tremble due to the vast deserted space.
According to Hoàng Văn Cơ, a local in the village, Thẳm Phầy in Tày language means “fire” cave, which was discovered by locals many years ago. It is about 5-6km long. 
Thẳm Phầy cave was likely formed due to volcanic eruptions and the tectonics of limestone mountains passed by underground rivers to cause erosion, combined with water droplets having the minerals of limestone dripped after millions of years, creating many beautiful stalactites and stalagmites.
The mouth of the cave is hidden, so it is difficult to find. From the cave entrance, going down about 20m is quite slippery because the ground is below and water comes down from the cave door.
Right at the entrance to the cave are rocks shaped like the teeth of a giant dinosaur, below is an underground stream with a shallow and moderate flow. While the stream inside is quite wide, the water in some places is about 1.5m deep. In many places, the water erosion process forms yellow and white stalactites with many beautiful and mysterious shapes.
Over the cave ceiling and cave walls are beautifully shaped stalactites. The two sides of the entrance to the cave also have rocky banks with beautiful shapes. Going deep into the cave, many bats cling to the dome.
About 1km from the entrance, there are two branches of the cave, one on the left runs into the mountainside, while the other on the right reaches the heart of the mountain with the deep water level.
We decided to follow the left side and went from surprise to surprise. The bottom of the underground stream is mainly sand so we could see the spring bed through the clear water.
The water source in the cave is completely pure and provides water for people in the village.
Stalactites and stalagmites with vivid shapes seemed to hold our feet. Sometimes it looks like the curtains of a castle, sometimes like a silk strip lying indifferently on the cliff. There are winding stone veins as if they are taken care of by skilled craftsmen. There are many stalactites like silk threads on the cave walls.
We saw water flowing from the mountain, forming small geysers along the cliffs. They are very unique, sometimes like a small waterfall, sometimes like the mouth of a large tube.
The highest area of the left cave is about 20m high. It is wide as a building with short and long stalactites. It also has many rock layers.
The deeper we got into the cave, the cooler the air became and the deeper the spring grew.
Meanwhile, people following the right branch had to dive under the water to get through the canopy, but the depth of the cave in this branch was short so they returned.
According to Cơ, during the flood season, the stream near the cave''s mouth is very dangerous and water can rise up at any time to flood the cave ceiling.
We thought that Thẳm Phầy cave was a little similar to Sơn Đoòng cave in Quảng Bình Province, the world’s largest natural cave. Thẳm Phầy also has a beautiful rocky shore forming a path in the cave. Its arch is wide and high, while below is water flowing with the presence of bats and lush vegetation.
Thẳm Phầy cave is being assessed by the local authorities to be used as a unique tourism product of Bắc Kạn Province, but the exploitation will have to ensure sustainable development. — VNS', '2021-05-17 12:08:05.15', 2, 8);
INSERT INTO public.article VALUES (20, 'Shop the Most Comfortable Sandal Trend, Maybe Ever', 'https://assets.vogue.com/photos/60773956c8b51b2b19206007/master/w_1600%2Cc_limit/00001-Simon-Miller-RTW-Spring-21.jpeg', 'After a year of indoor shoes, shearling slippers, fuzzy socks—or perhaps no shoes at all—footwear designers have blessed us with something just as comfortable to wear outside of the house. They’ve responded to our wants (and needs) and have given us an alternative to the shoes our feet have gotten so used to: the cushy sandal.', 'After a year of indoor shoes, shearling slippers, fuzzy socks—or perhaps no shoes at all—footwear designers have blessed us with something just as comfortable to wear outside of the house. They’ve responded to our wants (and needs) and have given us an alternative to the shoes our feet have gotten so used to: the cushy sandal. Pillowy, padded, and molded styles are no longer reserved for orthotic footwear and walking shoes; they’re elements now embraced by our favorite shoe brands. Sink your feet into the most comfortable sandals for women—they’re some of the softest shoes you’ll ever have the pleasure of sliding your quarantined toes into, and they are, in fact, quite stylish.
Take, for example, Simon Miller’s puffed platform slides or Staud’s foam platform thongs. Plus the classic crisscross slide sandal, a summer staple, is now being offered with a memory-foam cushioned sole, thanks to Marina Larroude’s thoughtful brilliance. There are even terry cloth slides in eye-catching colors you can actually wear outside.
Bid adieu to stiff and painful sandals, blisters, and sore feet, and welcome to the world of ultimate laid-back luxury. Here, shop the most comfortable sandal trend, maybe ever. Being cozy never looked so cool.', '2021-05-17 12:08:05.15', 2, 9);
INSERT INTO public.article VALUES (21, 'Cramer’s week ahead: The impact of inflation and the reopening as earnings season accelerates', 'https://image.cnbcfm.com/api/v1/image/105844708-1554931627181img_1327r.jpg', 'Next week marks the beginning of the real earnings season, CNBC’s Jim Cramer said.“We’re actually going to get the impact of both inflation and the reopening,” the “Mad Money”', 'CNBC’s Jim Cramer said Friday that the “real earnings” season will get underway Monday after the major banks posted their quarterly results earlier this week.
“We’re actually going to get the impact of both inflation and the reopening,” he said on “Mad Money.” “I think the former’s a big negative, but the latter’s so positive that the ball can stay in the air, ready for a beautiful stuff over the net and to the floor.”
Cramer gave his game plan for the week ahead. Earnings-per-share projections are based on FactSet estimates:
Monday: Coca-Cola, United Airlines, IBM
Coca-Cola
Q1 2021 earnings release: before market; conference call: 8:30 a.m.
Projected EPS: 50 cents
Projected revenue: $8.68 billion
“I worry that Coca-Cola’s pure beverage with no snacking business,” Cramer said, “but I still expect a good number from them and a great story about food service reopenings.”
United Airlines
Q1 2021 earnings release: after market; conference call: Tuesday at 10:30 a.m.
Projected losses per share: $7.05
Projected revenue: $3.27 billion
“If it’s anything like Delta, you’re going to hear about the coming boom,” he said, adding the stock can continue to rally. “I think it’s the right place to be.”
IBM
Q1 2021 earnings release: after market; conference call: 5 p.m.
Projected EPS: $1.69
Projected revenue: $17.32 billion
“What will the new IBM do, the one that kept the fast-growing businesses led by Red Hat? I think it’s too early to tell, but the stock’s been hanging in there,” Cramer said.
Tuesday: Abbott Laboratories, Johnson & Johnson, Procter & Gamble, Netflix
Abbott Laboratories
Q1 2021 earnings release: before market; conference call: 9:30 a.m.
Projected EPS: $1.27
Projected revenue: $10.69 billion
“Abbott’s done such great work on Covid diagnostics … that it’s hard to believe they won’t hit it out of the park,” Cramer said.
Johnson & Johnson
Q1 earnings 2021 release: 6:45 a.m.; conference call: 8:30 a.m.
Projected EPS: $2.34
Projected revenue: $22 billion
“J&J’s gotten more controversial, though I think it’s been unfairly punished by a CDC that seems more intent on scaring the public out of getting a vaccination than actually getting people vaccinated with some safety,” he said. “I bet J&J has a fantastic quarter and reveals an even better pipeline.”
Procter & Gamble
Q3 2021 earnings release: before market; conference call: 8:30 a.m.
Projected EPS: $1.19
Projected revenue: $17.97 billion
“The Street’s actually worried about this one. First, there are tough comparisons versus the stay-at-home numbers they were putting up a year ago,” the host said. “Second, they’re coping with real inflation from plastics to surfactants [and] freight.”
Netflix
Q1 2021 earnings release: 4 p.m.; conference call: 6 p.m.
Projected EPS: $2.97
Projected revenue: $7.14 billion
“This should be fun. Netflix typically beats the numbers and the principals always seem to have a great time talking about their business,” he said. “Even the Netflix conference call has good content.”
Wednesday: Verizon, Lam Research, Chipotle
Verizon
Q1 2021 earnings release: 7:30 a.m.; conference call: 8:30 a.m.
Projected EPS: $1.29
Projected revenue: $32.47 billion
“I’m beginning to believe it’s stuck there, making it feel like more of a bond than a stock,” Cramer said. “If you’ve gotta own a phone company, I have to tell you I prefer T-Mobile.”
Lam Research
Q3 2021 earnings release: after market; conference call: 5 p.m.
Projected EPS: $6.61
Projected revenue: $3.72 billion
“Lam is the answer to the semiconductor shortage—they make the equipment needed to manufacture new chips,” he said. “When you hear Taiwan Semi endlessly talking about raising its capital equipment budget, that means that Lam is going to make a fortune.”
Chipotle
Q1 earnings release: 4:10 p.m.; conference call: 4:30 p.m.
Projected EPS: $4.89
Projected revenue: $1.75 billion
“I’m betting this paragon of great natural food and phenomenal customer service will blow the doors off the quarter, triggering another round of price target boosts as the analysts desperately try to play catch-up to the stock price,” the host said.
Thursday: Union Pacific, Dow, Danaher, Nucor, Intel Boston Beer
Union Pacific
Q1 2021 earnings release: 8 a.m.; conference call: 8:45 a.m.
Projected EPS: $2.06
Projected revenue: $5.05 billion
“I think Union Pacific is going to tell a story of making more with less, meaning efficiency galore,” Cramer said.
Dow
Q1 2021 earnings release: 6 a.m.; conference call: 8 a.m.
Projected EPS: $1.12
Projected revenue: $11.09 billion
“If PPG is any guide from last night, it should put up some amazing numbers, allowing the stock to break out to the $70s,” he said.
Danaher
Q1 2021 earnings release: 6 a.m.; conference call: 8 a.m.
Projected EPS: $1.76
Projected revenue: $6.29 billion
“I can’t wait to see how well they’re doing,” the host said. “I expect a fantastic quarter.”
Nucor
Q1 2021 earnings release: TBD; conference call: 2 p.m.
Projected EPS: $3.05
Projected revenue: $7.18 billion
“We’re in an inflationary era, whether it’s transitory or whether it’s not, so Nucor should put up some incredible numbers,” he said.
Intel
Q1 2021 earnings release: after market; conference call: 5 p.m.
Projected EPS: $1.14
Projected revenue: $17.78 billion
“I think Pat’s doing a terrific job inspiring people both inside and outside this great institution,” Cramer said. “If the stock gets hit, I’d be a buyer. Gelsinger can’t turn the Intel battleship on a dime, but it will be turned.”
Boston Beer
Q1 2021 earnings release: 4 p.m.; conference call: 5 p.m.
Projected EPS: $2.55
Projected revenue: $477 million
“I think the shorts will be leaning against Boston Beer, as they always do, because of the [spiked seltzer] competition,” he said. “My view? The category’s growing so rapidly, the parent of Sam Adams should do just fine, thank you.”
Friday: Honeywell, American Express
Honeywell
Q1 2021 earnings release: before market; conference call: 8:30 a.m.
Projected EPS: $1.80
Projected revenue: $8.08 billion
“Honeywell’s becoming a software-as-a-building-service play, not to mention an incredible health care company. I think the numbers can go higher still,” Cramer said.
American Express
Q1 earnings release: 7 a.m.; conference call: 8:30 a.m.
Projected EPS: $1.61
Projected revenue: $9.21 billion
“It’s all about gauging the power of the great reopening. With its combination of small business … credit, travel and entertainment lines, we should be able to get a good read on the strength of the recovery going forward,” he said.', '2021-05-16 05:51:05.15', 3, 1);
INSERT INTO public.article VALUES (22, 'Sopore terror attack: Death toll rises to 3 as another councillor succumbs to injuries', 'https://english.cdn.zeenews.com/sites/default/files/2021/03/30/926227-sopore-attack.jpg', 'Police''s preliminary investigation indicates that a local terrorist of proscribed terror outfit LeT along with a foreign terrorist are involved in Jammu and Kashmir''s Sopore attack.', 'New Delhi: The death toll in Jammu and Kashmir''s Sopore terrorist attack has risen to three after another councillor succumbed to his injuries. Councillor Shamas Ud din Peer died at a Srinagar hospital.
On Monday (March 29, 2021), police personnel Shafat Nazir Khan and councillor Reyaz Ahmad had lost their lives in the terror incident. The wreath-laying ceremony of Shafqat and Riyaz was held at DPL Sopore, where CRPF DIG also paid his tributes.
IGP Kashmir Vijay Kumar-IPS had visited PD Sopore and inspected the scene of terror crime, following which, he chaired a security review meeting with Commander 5-Sector RR, DIG CRPF and SSP Sopore.
Police''s preliminary investigation revealed that terrorists had fired indiscriminately upon the Municipal Councillors near Lone Building opposite SDH Sopore.
The preliminary investigation also indicates that a local terrorist Mudasir Pandit of proscribed terror outfit LeT along with a foreign terrorist are involved in the said attack. 
"IGP Kashmir also took serious note of the poor and inappropriate retaliation by the PSOs of protected persons present on spot and directed SSP Sopore to put four PSOs under suspension," Police''s statement said.
Meanwhile, cordon and search operation at various locations is going on to nab the assailants.', '2021-05-17 12:08:05.15', 3, 10);
INSERT INTO public.article VALUES (23, 'Blackpink’s Jisoo in Snowdrop: Her K-drama character’s name changed after historical issues', 'https://www.channelnewsasia.com/image/13033278/1x1/600/600/a7fc2012bc99026ad763a71920065131/uv/blackpink-jisoo.jpg', 'Her character’s name in the upcoming series was similar to that of a prominent figure in the 1987 student protests in South Korea, Chun Young Cho.', 'Jisoo from K-pop group Blackpink will have her character name in the upcoming drama Snowdrop changed. This comes after online chatter that the name is similar to that of Chun Young Cho, a real-life prominent figure during South Korea''s 1987 student protests. Jisoo’s character was initially named Young Cho.
South Korean broadcast company JTBC released a statement saying that although the character’s name is not related to the activist, they will change it since it’s been pointed out that it’s similar.
Snowdrop, which is scheduled to air in the second half of this year, began facing criticism after the series synopsis was circulated online recently. There were concerns about a possible distortion of historical facts as the drama was said to be set during the pro-democracy movement and the male lead was a spy who infiltrated the movement while another male character was described as a team leader in the intelligence service.
South Korean viewers have been sensitive about issues surrounding Korean history following the cancellation of K-drama Joseon Exorcist after just two episodes. Viewers were upset over the historical distortions in the show, which included its depiction of the third king of the Joseon dynasty killing innocent people and the fourth, King Sejong, receiving a guest in a room with Chinese foods such as mooncakes.
The backlash for Joseon Exorcist was swift and its lead actor Jang Dong-yoon has issued an apology for his role in the controversy. He said, "I’m incredibly sorry. I failed to fully recognise that this drama would become so problematic ... I only looked at the drama from the perspective of an actor acting out a creative work. I neglected my responsibility to look carefully (at the drama) from a societal perspective".
JTBC responded to criticisms of Snowdrop, clarifying that the controversy comes from incomplete synopsis and character descriptions, as well as speculations and false information. They explained that the drama will not deal with the pro-democracy movement and that the leads of the show do not participate in the movement. 
They also clarified that the background of the show is the 1987 presidential election and not the pro-democracy movement. The company also asked people to refrain from misleading the public with false information.', '2017-05-01 00:00:00.15', 3, 2);
INSERT INTO public.article VALUES (24, 'Denmark: Three die of salmonella poisoning linked to herbal remedy', 'https://ichef.bbci.co.uk/news/976/cpsprodpb/5588/production/_118069812_huskcomp.jpg', 'Three people have died in what Danish health authorities say is a large outbreak of salmonella that has left 33 people ill.', 'Denmark''s Statens Serum Institut, the country''s agency for preparedness against infectious diseases, on Thursday said an outbreak of salmonella linked to health products had now affected 33 people.
Several of those who were infected had become seriously ill, with three fatalities so far and 19 people hospitalized.
Those found to have common bacterial disease were aged between two years old and 92. A common factor among all of those who became ill was that they had all taken Psyllium seed HUSK herbal capsules.
The Danish Veterinary and Food Administration recovered the product from the homes of two patients and was able to show that it contained salmonella. Several HUSK products were subsequently recalled.
"This is a serious and large outbreak," said Luise Müller, an epidemiologist from the SSI.
"This is the first time that we have been able to identify a natural medicine as the cause of a salmonella outbreak."
Müller said a particular worry was that the people who took the product – purported to increase dietary fiber and improve bowel movements - were often already suffering from stomach problems.
"I am therefore concerned that the salmonella infection is not detected because the people or their doctor think that the symptoms of the salmonella infection stem from their existing stomach problems," says Luise Müller.
People with HUSK Psyllium seed husk capsules or HUSK Psyllium Stomach Balance supplements are asked to check against the batch numbers in question through a link.
Even if individuals have taken the supplements, the risk of infection with salmonella is considered small and symptoms are normally mild, the SSI said.', '2021-05-17 12:08:05.15', 3, 3);
INSERT INTO public.article VALUES (25, 'Việt Nam, Brunei agree to maintain joint committee', 'https://image.vietnamnews.vn/uploadvnnews/Article/2021/4/14/147379_3875868885130028_a1.jpg', 'HÀ NỘI — Minister of Foreign Affairs Bùi Thanh Sơn held phone talks with Brunei Second Minister of Foreign Affairs Dato Erywan Pehin Yusof on Tuesday, during which both agreed to maintain the two nations’ mechanism of the joint committee on bilateral co-operation.', 'The Brunei minister congratulated Sơn on his appointment as foreign minister and praised Việt Nam’s work in pandemic prevention and socio-economic development as well as its outstanding achievements in external relations, including its 2020 ASEAN chairmanship and the position as a non-permanent member of the UN Security Council for 2020 – 2021.
Minister Sơn spoke highly of the two nations lifting of their ties to a comprehensive partnership on the occasion of the Sultan of Brunei’s visit to Việt Nam in 2019 and expressed his delight at the sound development of their co-operation, particularly in trade last year despite the COVID-19 pandemic.
Both ministers agreed to build an action plan to implement the comprehensive partnership for the next five years and regularly and effectively maintain the nations’ mechanism of the joint committee on bilateral co-operation while studying to establish a political consultation mechanism and signing a memorandum of understanding on co-operation between the two foreign ministries as soon as possible.
They also agreed to the two nations’ ties in trade and investment.
Sơn took the occasion to thank Brunei and other ASEAN states for supporting Việt Nam in holding its role as ASEAN Chair in 2020 and as a non-permanent member of the UN Security Council for 2020 – 2021.
Việt Nam is backing Brunei’s ASEAN chairmanship this year, he said.
Sơn invited Dato Erywan Pehin Yusof to visit Việt Nam at a convenient time, and the Brunei minister accepted with pleasure. — VNS', '2021-05-17 12:08:05.15', 3, 4);
INSERT INTO public.article VALUES (26, 'A meteor may have exploded over Antarctica 430,000 years ago', 'https://www.sciencenews.org/wp-content/uploads/2021/03/033021_SP_airburst_feat.png', 'A similar impact today in a populated area would be devastating', 'Seventeen tiny particles recovered from a flat-topped mountain in eastern Antarctica suggest that a space rock shattered low in the atmosphere over the ice-smothered continent about 430,000 years ago.
The nickel- and magnesium-rich bits were sifted from more than 6 kilograms of loose sediments collected atop the 2,500-meter-tall summit of Walnumfjellet, says Matthias van Ginneken, a cosmochemist at the University of Kent in England. Their exotic chemistry doesn’t match Earth rocks, but it does match the proportions of elements seen in a type of meteorite called a carbonaceous chondrite, van Ginneken and his colleagues report March 31 in Science Advances.
Most of the particles range in size from 0.1 to 0.3 millimeters across, and more than half consist of spherules that are fused together into odd-shaped globs. The elemental mix in the spherules closely matches that of particles found at two other far-flung sites in Antarctica— one more than 2,750 kilometers away — which suggests that all of the materials originated in the same event. Because the other particles were found in ice cores and dated to about 430,000 years ago, the team presumes that the newly found particles from Walnumfjellet fell then too.
The meteor that broke up over Antarctica was between 100 to 150 meters across, the team’s simulations suggest, and probably burst at low altitude. Blast waves may have pummeled a 100,000-square-kilometer area of the ice sheet, the team estimates. The explosion left no crater, but peak temperatures where the plume of hot gases reached Earth’s surface would have hit 5,000° Celsius and may have melted up to a few centimeters of ice. A similar airburst over a densely populated area today would result in millions of casualties and severely damage an area hundreds of kilometers across (SN: 5/2/17).', '2021-05-17 12:08:05.15', 3, 5);
INSERT INTO public.article VALUES (27, 'RNG and FunPlus Phoenix look to fill in the last piece of the MSI 2021 puzzle', 'https://cdn1.dotesports.com/wp-content/uploads/2021/04/15125556/Screenshot-2021-04-15-134922-2048x1347.jpg', 'Both teams are looking to qualify for their first international tournament since 2019.', 'It seems that every time FunPlus Phoenix and RNG go head to head, both teams tend to have a knack for the extreme. Both of their matches this spring have ended with one of the teams failing to record a win. RNG took down FPX 2-0 back in February, while FPX got revenge by way of a 3-0 sweep in the playoffs last week.
These two teams have earned their way to the 2021 LPL Spring Split finals. There’s no doubt about that. But this series is a battle between two League of Legends teams that have been on opposite paths as of late, despite the fact that they’ve both reached the same destination. 
FPX are the team that many fans believed would be a contender in some capacity. With five world champions lining the roster, locking FPX in for a chance at an LPL title was low-hanging fruit. But RNG, on the other hand, are something of a dark horse in comparison. Sure, they earned their spot in the finals by way of a first-place finish in the Spring Split in combination with some impressive playoff victories, but it still feels like they don’t belong here when compared to an FPX team that’s been practically cruising to victory after victory as of late. 
RNG had to claw tooth and nail to get through two soul-sucking series against Top Esports and EDG during rounds four and five of the Spring Split playoffs, respectively. Both of those series were won via 3-2 scorelines. Now, as RNG faces off against a scalding hot FPX team that’s won 12 of their last 16 games, the deck is unquestionably stacked against them. In an obviously rare turn of events, the No. 1 seed feels like an underdog.
But if RNG are going to finish their storybook split and prove once and for all that they’re the best possible candidate to represent the LPL at this year’s Mid-Season Invitational, they’ll have to do so through a player who’s served as their rock for years: Xiaohu. 
The displaced mid laner, now finding a resurgence in the top lane, has been a major factor in RNG’s run to the top of the league. During the team’s last series against EDG, Xiaohu posted a scoreline of 21/11/38, practically dragging RNG to the finish line singlehandedly. His 4.1 KDA across 50 individual games in 2021 ranks third among LPL top laners, according to League stats site gol.gg. And his immensely deep champion pool has served as the backbone of his play throughout the season thus far. 
Xiaohu’s former experience as a mid laner has allowed RNG to draft creative strategies in the top lane, placing the veteran solo laner on some of his old pocket picks such as Syndra and Orianna at various points this season. While we probably shouldn’t go into the LPL Spring Split finals expecting to see top lane control mages out of Xiaohu, it’s important to keep that depth in the back of our minds. Plus, teams love to keep their most bizarre and out-of-the-box strategies saved for important moments. Xiaohu has played 55 different champions in his career, so really, anything is on the table.
But while it’s easy to place a high amount of stock in Xiahou considering the way he’s been playing as of late, it’s easy to get flustered once you look across the lane and realize who he’s up against. Nuguri, the best top laner in the world, is a practical brick wall in the face of RNG’s run to greatness. 
Nuguri is looking to become the second player in the last week to win a championship in two different regions after Perkz managed to do so with Cloud9. And while Nuguri’s 3.9 KDA is sufficient, the fact that he’s made up 29.5 percent of FPX’s total playoff damage from the top lane, according to gol.gg, is borderline unbelievable. That’s the kind of “take-the-bull-by-the-horns” statistic that brings home a title without question.
Plus, Nuguri has shown that he’s not one to shy away from off-meta picks, either. Seemingly every time he pulls a rabbit out of his hat, Nuguri finds success. Last weekend, he confidently rocked a Sylas pick against EDG in a game five scenario, winning with the champion to the tune of a 2/2/10 scoreline over Flandre’s top lane Sejuani. That series also saw Nuguri pick Sett twice, making him just one of three major region top laners to play the champion on multiple occasions this season.
Regardless of whether Xiaohu and Nuguri decide to play within the confines of the meta or completely skirt around it, know this: Whoever gets the edge in this matchup will raise their team’s chances of the title by a significant margin. Xiaohu and Nuguri have been the most impressive players on their respective teams as of late. Even when RNG and FPX drop individual games, the top laners usually aren’t the cause. 
All told, we’re predicting FPX to walk away with the 2021 LPL Spring Split title this weekend by way of a 3-1 scoreline. While it might seem unfair to discredit RNG’s ability to push a third consecutive series to five games, FPX are simply a different beast. 
The fact that it took every possible ounce of effort from RNG to secure two victories against Top Esports and EDG earlier in the playoffs is a bad omen for the team coming into the hardest matchup they’ve faced yet. Plus, FPX’s 3-0 victory over RNG just over a week ago isn’t necessarily a good sign for those seeking a close series.
We’re willing to give RNG a game considering the team has looked strong enough to contend and raise eyebrows all spring. But with more chips on the table than ever before, the bonafide studs stand out as obvious favorites. This isn’t the same FPX squad that rolled over and died against RNG earlier in the split. This team is revitalized, and with a 12-4 record in the playoffs thus far, they’ve shown zero signs of slowing down any time soon. 
At this pace, FPX look like a contender for an LPL title and a contender for the MSI title next month. After failing to repeat 2019’s World Championship-winning campaign last season, there’s no doubt that FPX are on a mission to reclaim supremacy. 
The 2021 LPL Spring Split finals kick off on Sunday, April 18 at 4am CT.', '2021-05-17 12:08:05.15', 3, 6);
INSERT INTO public.article VALUES (28, 'Lego Luigi will probably join Mario soon', 'https://www.cnet.com/a/img/UqtQUbXiP8qdd2XVqk23mi7eupE=/1092x0/2019/07/18/11dc04cd-0afb-4993-b872-c14172ecf5d6/cr5fyb6r47dgyw5qm8zwlv-1200-80.jpg', 'Lego''s electronic Mario figure apparently started calling out for his brother after a firmware update.', 'Lego Mario is suddenly eager to see his taller, greener brother. The electronic figure of Nintendo''s mascot started calling out for Luigi following a firmware update this week, as revealed in Jay Phoenix''s Twitter video and previously reported by Eurogamer.
"We''re looking into it and hope to have clarity on why this is soon. Stay tuned!" the company wrote, implying an announcement is on the way.
Lego''s first Mario set came out last summer and was the result of a four-year collaborative project with Nintendo. More sets came out earlier this year, filling out the Mushrooms Kingdom''s cast of characters. We also got a Lego Nintendo Entertainment System set, if you prefer to build gray ''80s game consoles.', '2021-05-17 12:08:05.15', 3, 7);
INSERT INTO public.article VALUES (29, 'Hòn Sơn- untouched island in Kiên Giang Province', 'https://image.vietnamnews.vn/uploadvnnews/Article/2021/2/4/136762_CH5.jpg', 'HCM CITY — Kiên Giang’s Hòn Sơn Island, located between Hòn Tre Island and Nam Du Archipelago, is a new destination for a summer retreat, with beautiful white sandy beaches and imposing mountains.', 'Considered one of the most beautiful islands in Kiên Giang, Hòn Sơn is a new hidden gem for nature-loving tourists. With its pristine beauty, graceful beaches reflecting the vast ocean, Hòn Sơn appears as a sparkling jewel surrounded by coconut groves, with a wild look.
With limited infrastructure, islanders are highly sensitive to the environment, and use eco-friendly paper straws at coffee houses.
The best time to visit Hòn Sơn Island is from May to December when weather conditions allow for calm seas and fresh, cheap seafood.
To reach the island, fly to Rạch Giá Airport from Hà Nội or HCM City, then catch a VNĐ140,000 (US$6) hour-and-a-half speedboat ride from Rạch Giá Pier. Alternatively, you could also travel by traditional ferry for VNĐ90,000 (US$3.9), which takes around 3.5 hours. — VNS', '2021-05-17 12:08:05.15', 3, 8);
INSERT INTO public.article VALUES (30, 'The Best Street Style at Seoul Fashion Week Fall 2021', 'https://assets.vogue.com/photos/6061e240ebba89019c9c5f30/16:9/w_1600%2Cc_limit/00-story.jpg', 'The fall 2021 season just wrapped up in Seoul, where locals attended a few IRL presentations between dozens of mostly virtual shows. Our photographer Nam Huynh was there to cover the best street style looks around the city', 'The fall 2021 season just wrapped up in Seoul, where locals attended a few IRL presentations between dozens of mostly virtual shows. Our photographer Nam Huynh was there to cover the best street style looks around the city. Some of the local trends feel familiar, like the lug-sole boots and deconstructed suits we saw elsewhere in Asia and Europe earlier this year. The bigger surprise might actually be the prevalence of head-to-toe black. Maybe the weather has something to do with it—several people were photographed with umbrellas—but either way the darker, pared-back look is a sleek pivot after years of bright colors and experimentation.', '2021-05-17 12:08:05.15', 3, 9);
INSERT INTO public.article VALUES (31, 'Robinhood and Coinbase top Apple App Store', 'https://image.cnbcfm.com/api/v1/image/105991232-1561638684781buy-bitcoin-feat.jpg', 'Trading platforms Robinhood and Coinbase grabbed the top two spots in Apple’s app store this week as Americans turn to the markets for entertainment.', 'Watch out social media, finance apps are becoming a more popular form of entertainment on people’s phones.
Trading platforms Robinhood and Coinbase grabbed the top two spots in Apple’s App Store this week as Americans turn their attention to stock and cryptocurrency markets.
Robinhood notched the no. 1 spot on Friday, followed by crypto trading platform Coinbase, according to data from Sensor Tower. TikTok was third. The surge in popularity comes as Coinbase made its debut on the Nasdaq on Wednesday, and bitcoin topped $64,000 for the first time.
The surge in popularity underlines a boom in retail trading during the pandemic and “meme stock” culture around names like GameStop. The video game retailer became a household name in January after a group of traders on Reddit sparked a historic short squeeze.
Typically, social media and entertainment options such as TikTok, Reddit and Instagram are the top apps. The rankings reflect the momentum in downloads of a certain app, not necessarily the total cumulative downloads.
This isn’t Robinhood’s first time at the number one spot. In January, at the height of the GameStop controversy, the brokerage firm was the most popular app in Apple and Google app stores. Webull, another trading app, was second. Coinbase, Square’s Cash App and Fidelity also made the top 10.
Robinhood, which shut down the buy side of certain stocks during the height of the GameStop frenzy, saw blowback on social media, and its CEO was later called testify in front of Congress. But Robinhood still added an estimated 3 million customers in January alone, according to estimates from JMP Securities.
Venture capital investors watch engagement and download numbers closely. Until recently, those metrics had mostly been used to measure the success of social media apps. Robinhood investors are now using similar metrics. It was able to raise $3 billion in capital over a few days in January, which investors told CNBC was due to its eye-popping growth as it dealt with a public relations and regulatory crisis.
Charles Schwab said Thursday it added a record 3.2 million new clients in the first quarter — more new accounts than in all of 2020. CEO Walt Bettinger credited “heightened market attention to certain names via social media” as one factor that “significantly bolstered trading activity.”', '2021-04-16 01:35:32', 4, 1);
INSERT INTO public.article VALUES (32, 'Government agencies must update Microsoft Exchange as feds warn of ‘unacceptable’ security risk', 'https://image.cnbcfm.com/api/v1/image/106752827-16032179652020-10-20t180303z_478598040_rc2imj9qtbb7_rtrmadp_0_usa-election-cyber-botnet.jpeg', 'Microsoft on Tuesday issued new patches for the 2013, 2016 and 2019 versions of Exchange. Unlike patches issued in March, which fixed gaps that had been exploited by Chinese hackers, Microsoft said it is not aware of exploits of these new vulnerabilities.', 'Microsoft on Tuesday released patches for three versions of its Exchange Server email and calendar software that companies use in on-premises data centers, and the federal government has ordered all agencies to install them, warning that the vulnerabilities being patched “pose an unacceptable risk to the Federal enterprise and require an immediate and emergency action.”
The updates come a month after Microsoft took action to respond to attacks on other flaws in Exchange Server, which the company said had been exploited by Chinese hackers. But unlike last time, Microsoft said in a blog post it has not yet observed exploits of the newly discovered holes.
Nonetheless, the widespread usage of Exchange, and the importance of email in general, has spurred the federal government to sound the alarm.
In a Tuesday directive, the U.S. Cybersecurity and Infrastructure Security Agency noted that these vulnerabilities are “different from the ones disclosed and fixed in March 2021” and ordered all government agencies to deploy the patches before Friday.
“Given the powerful privileges that Exchange manages by default and the amount of potentially sensitive information that is stored in Exchange servers operated and hosted by (or on behalf of) federal agencies, Exchange servers are a primary target for adversary activity,” CISA wrote. “This determination is based on the likelihood of the vulnerabilities being weaponized, combined with the widespread use of the affected software across the Executive Branch and high potential for a compromise of integrity and confidentiality of agency information.”
The new patches apply to the 2013, 2016 and 2019 versions of Exchange Server.
The company said organizations using the cloud-based Exchange Online service included in Microsoft 365 subscription bundles is already protected.
Microsoft gave credit to the U.S. National Security Agency for reporting the new vulnerabilities.', '2021-04-13 10:35:32', 4, 10);
INSERT INTO public.article VALUES (33, 'Amazon’s ‘Lord of the Rings’ series will cost at least $465 million for first season', 'https://image.cnbcfm.com/api/v1/image/106832365-1611930800281lord-of-the-rings-Cropped-jpg', 'Amazon’s “Lord of the Rings” could be one of the most costly television series ever made, with its season one price tag coming in at around $465 million.', 'Amazon’s “Lord of the Rings” television show is shaping up to be a costly endeavor for the tech company
On Friday, New Zealand’s minister for economic development and tourism revealed that the fantasy drama will be one of the most costly television series ever made, with its season one price tag coming in at around $465 million.
“But what I can tell you is Amazon is going to spend about $650 million in season one alone,” Stuart Nash told Morning Report. The figure he provided was in local currency.
The production figure is massive and likely the largest sum any studio has spent to produce a single season of television. For comparison, HBO’s “Game of Thrones” cost around $100 million per season. Season one episodes cost around $6 million each and eventually rose to around $15 million by season eight.
Amazon shelled out around $250 million for the rights to the Tolkien property in 2017.
“This will be the largest television series ever made,” Nash said.
The figures, released as part of the New Zealand government’s Official Information Act, were first reported by the New Zealand-based outlet Stuff. Its report indicated that Amazon is looking to film five seasons in the country and possibly produce a spinoff series.
Amazon’s spending in New Zealand will trigger a tax rebate of around $114 million and has been flagged as a “significant financial risk” by the country’s treasury. There’s no cap on how much Amazon is allowed to spend, and therefore, New Zealand could be on the hook for hundreds of millions of dollars to help subsidize the project.
However, the production will likely bring a large financial boost to the local economy, as Amazon pays for local labor, hotels and food, among other things. Then there is the future tourism bump. Peter Jackson’s “Lord of the Rings” and “Hobbit” film trilogies were a big boon to New Zealand, as they brought in travelers from around the world.
The “Lord of the Rings” series is currently in production and expected to debut in late 2021.', '2021-04-14 17:35:32', 4, 2);
INSERT INTO public.article VALUES (64, 'making it waiting for players to join', 'https://znews-photo.zadn.vn/w660/Uploaded/ofh_btgazspf/2020_04_21/72425168_2190164277756889_5548989457421565952_o.jpg', 'making it waiting for players to joina', 'making it waiting for players to joinasca', '2021-05-12 10:49:10.293', 9, 6);
INSERT INTO public.article VALUES (34, 'Johnson & Johnson vaccine pause makes it tougher to immunize hard-to-reach populations against Covid', 'https://image.cnbcfm.com/api/v1/image/106869947-1618664412422-gettyimages-1219831195-ajr_5882_20200419100452702.jpeg', 'For some populations, such as prisoners changing facilities or homeless people who don’t have a permanent residence, administering a two-dose regimen is a challenge.', 'The Johnson & Johnson Covid vaccine pause may not significantly slow the overall pace of the U.S. vaccine rollout, but is making it tougher for hard-to-reach populations to get a shot.
Following the Food and Drug Administration’s request on Tuesday that states temporarily halt using the J&J vaccine “out of an abundance of caution” after six women developed a blood-clotting disorder, White House Covid czar Jeff Zients said that the announcement would not have a significant impact on the U.S. vaccination program.
“We have more than enough supply of Pfizer and Moderna vaccines to continue the current pace of about 3 million shots per day,” Zients told reporters at a press briefing.
So far, this has held true. The country is averaging 3.3 million daily vaccine doses reported administered over the past week, and 3 million when counting only Pfizer and Moderna. Only about 7.8 million of the 202 million total shots given in the U.S. have been from J&J, according to Centers for Disease Control and Prevention data.
But the single-shot Johnson & Johnson vaccine does represent about 10% of all fully vaccinated people in the U.S., a proportion that was on the rise for weeks, and it has proven valuable for certain situations and communities.
“Because of the characteristics of the J&J vaccine, it is being used in many cases for particular circumstances and populations for which it has been harder to get vaccines for,” said Josh Michaud, associate director for global health policy at the Kaiser Family Foundation. 
Mass vaccination sites and mobile vans that drive doses to be administered on the go likely have an easier time with the Johnson & Johnson storage requirements, Michaud said. That vaccine only needs to be kept in a standard refrigerator while the needs for Pfizer and Moderna are more strict.
And for certain populations, such as prisoners who are changing facilities or homeless people who do not have a permanent residence, administering a two-dose regimen can be a challenge. Many states have been using the J&J vaccine with these groups because it’s hard to find people to administer a second dose, according to Michaud.
The one-shot option may also be more appealing to those who are more hesitant to get a vaccine. A March Kaiser Family Foundation survey showed that among those who say they want to wait and see how the vaccines are working before getting vaccinated themselves, a larger share would get the J&J one-dose vaccine compared to either of the two-dose options.
One in six people in the “wait and see” group said they would “definitely get” the J&J vaccine, while roughly one in ten said the same about the Pfizer or Moderna vaccines.
“We know there is a significant portion of people on the fence about vaccines in general,” Michaud said, “And I think the J&J vaccine is actually a plus for that group. It’s a big selling point for people on the fence.”
Add all of these factors up and the J&J pause could have “an important negative impact on the U.S. vaccination rate,” he said.
It is not yet clear how long the halt on using the Johnson & Johnson vaccine will last. White House chief medical advisor Dr. Anthony Fauci has said that the pause could last from a matter of days to a few weeks. 
Vaccinating the homeless
Shelly Nortz, deputy executive director for policy with the New York City-based advocacy group Coalition for the Homeless, said the Johnson & Johnson vaccine pause will make it harder to get shots for the population she works with.
The coronavirus has hit New York City’s homeless hard, particularly those in communal living facilities. A Coalition for the Homeless and New York University analysis showed that as of February, the age-adjusted mortality rate for sheltered homeless New Yorkers was 49% higher than the citywide rate.
And while the vaccination campaign among New York homeless is off to a solid start — Nortz said the city’s most recent announcement showed about 4,500 fully vaccinated single homeless adults out of some 21,000 in total, a pace not far behind the nationwide rate — the J&J halt is going to be a hurdle.
“Everybody was really eager to have the one-and-done situation with J&J,” she said, “especially for people who are unsheltered and therefore not in the same place predictably.”
The Coalition for the Homeless recently launched a partnership with the Center for Urban Community Services, which offers mobile medical care across New York, to provide the Johnson & Johnson vaccine at one of its emergency food sites. That program is now on hold, as are discussions about offering the J&J vaccine at the group’s headquarters where many clients come to pick up their mail.
Dr. Van Yu, chief medical officer at CUCS, agrees that a two-dose Pfizer or Moderna vaccine regimen makes things much more complicated.
“If you’re living outside, how am I going to find you in four weeks?” he said.
Yu said the shelter system can make it easier to keep track of people, but there is still a lot of churn as people come and go or are reassigned to one of New York City’s hundreds of shelter sites.
The ease of storing the J&J shots is another advantage when vaccinating the homeless, according to Nortz. 
“The fact that the other two approved vaccines require, in one case, deep refrigeration storage makes it very challenging to do anything mobile or pop-up or with an unknown number of people showing up,” she said.
Zients said Tuesday that all vaccine delivery channels, including mobile delivery units, are equipped to deliver all three vaccines. Yu said the Moderna vaccine is easy enough to handle at his group’s mobile sites, but that the Pfizer vaccine’s ultra-cold refrigeration requirement means it’s not an option.
He is currently sitting on 185 unused J&J doses, and does not have access to any Moderna vaccines.
Some homeless people in the South Bronx, where Noel Concepcion works as the department director of adult homeless services for the nonprofit group BronxWorks, have preferred the J&J vaccine because it only requires one dose. But the pause and surrounding misinformation is making it harder to communicate the importance of vaccinations to a group that is already skeptical of the government, Concepcion said, and it may fuel some hesitancy toward all three vaccine options.
BronxWorks had to cancel a vaccination event to use existing supply of J&J shots due to the pause, according to Concepcion.
J&J more convenient for many working people
Other barriers to getting a Covid vaccine, such as an inflexible work schedule or childcare responsibilities, have made the single-shot Johnson & Johnson vaccine an essential option for some.
Liz Schwandt, who runs a volunteer group called Get Out the Shot aimed at helping people book vaccine appointments in Los Angeles, said that many of the callers into her team’s helpline don’t have traditional job benefits or protections such as time off from work. Many of them are domestic workers such as house cleaners, private nannies, or gardeners who get paid in cash off the books. Some are employees who do not work a 9-to-5 job, like the group of night shift custodians that Get Out the Shot recently booked appointments for.
“We hear stories all the time like hey, my employer is making me get the vaccine, but won’t give me time off,” she said, adding that “for a working family, missing four hours of a shift [for a vaccination appointment] can be a big wage loss.” 
Childcare responsibilities and reliance on public transportation also make going to multiple appointments more tedious, according to Schwandt.
While Get Out the Shot books appointments for all three vaccines, Schwandt said the FDA’s initial approval of the J&J vaccine back in February was welcome news.
“We were so thrilled with it,” she said. “We loved having the one and done option for people.”
A CDC panel on Wednesday postponed a decision on Johnson & Johnson’s Covid vaccine while the investigation into the blood-clotting disorder continues. The panel is expected to reconvene next week, when it will decide what it will recommend to the CDC.', '2021-04-17 12:35:32', 4, 3);
INSERT INTO public.article VALUES (35, '‘Shameful,’ ‘unacceptable and unconscionable’: Biden faces blowback from Democrats over refugee cap', 'https://media1.s-nbcnews.com/j/newscms/2021_15/3465380/210416-pramila-jayapal-ew-323p_9e99e7aeb003bf3b8594ace784484b4d.fit-2000w.jpg', 'Democrats on Friday slammed President Joe Biden for keeping in place this year the cap on refugees allowed to enter the United States set by the Trump administration.', 'Democrats on Friday slammed President Joe Biden for keeping in place this year the cap on refugees allowed to enter the United States set by the Trump administration.
Rep. Pramila Jayapal, D-Wash., said it was ”unacceptable and unconscionable that the Biden administration is not immediately repealing Donald Trump’s harmful, xenophobic, and racist refugee cap that cruelly restricts refugee admissions to a historically low level.”
“After four painful years of fighting Trump’s all-out draconian assault on immigrants, President Biden promised to restore America as a beacon of hope and committed to increasing our refugee resettlement numbers. By failing to sign an Emergency Presidential Determination to lift Trump’s historically low refugee cap, President Biden has broken his promise to restore our humanity,” Jayapal, the chair of the Congressional Progressive Caucus, said. “We cannot turn our back on refugees around the world, including hundreds of refugees who have already been cleared for resettlement, have sold their belongings, and are ready to board flights.
Senate Majority Whip Dick Durbin, D-Ill., called the move "unacceptable."
"These refugees can wait years for their chance and go through extensive vetting. Thirty-five thousand are ready. Facing the greatest refugee crisis in our time there is no reason to limit the number to 15,000. Say it ain’t so, President Joe," Durbin, who chairs the Senate Judiciary Committee, said in a statement.
Sen. Bob Menendez, D-N.J., the chairman of Senate Foreign Relations Committee, also blasted Biden over the move.
“By failing to issue a revised Determination, the White House has not only stymied the number of refugees permitted entrance into the United States, but also it has prevented the Department of State from admitting vetted refugees currently waiting in the system who do not fit into the unprecedentedly narrow refugee categories designated by the Trump administration,” he said in a statement.
Rep. Ilhan Omar, D-Minn., who fled Somalia when she was a child and spent years in a refugee camp in Kenya before arriving in the U.S., tweeted that, “As a refugee, I know finding a home is a matter of life or death for children around the world.”
“It is shameful that @POTUS is reneging on a key promise to welcome refugees,” she said.
House Judiciary Chairman Jerry Nadler, D-N.Y., tweeted he was “deeply disappointed by today''s decision to maintain Trump''s lowest refugee admissions target," while Rep. Zoe Lofgren, D-Calif., who chairs the House Immigration and Citizenship Subcommittee, tweeted there was "no justification for this historically low refugee target."
"It undoes what the Admin agreed to in their consultation with me in February," she added.
Former Texas Democratic congressman and 2020 presidential candidate Julián Castro said, “this is a bad decision.”
“Trump gutted our refugee program, a cornerstone of our global leadership and values. His polices can’t be the default we carry on—especially for the sake of “optics,” he said in a tweet.
Earlier Friday, NBC News reported that Biden will not increase the number of refugees allowed to enter the U.S. this year, according to a senior administration official, breaking a prior promise to raise the cap from the historically-low level set by the Trump administration.
Biden notified Congress in February that he would increase the number of refugees allowed to enter the country from 15,000 to 62,500 in the fiscal year ending Sept. 30, upping it to 125,000 for the following year. But he never signed the presidential determination that would actually raise the cap, effectively keeping the cap at Trump-era levels. Such paperwork is usually signed shortly after a policy announcement.
Biden leaving the cap highlights the pressure on his administration to address the surge of migrants, many of them unaccompanied children, arriving at the U.S.-Mexico border seeking asylum. Republicans have criticized Biden for the situation, painting his administration as weak on border security.
Later Friday afternoon, in an apparent response to the outpouring of criticism, White House press secretary Jen Psaki said in a statement that Biden''s "directive today has been the subject of some confusion," and said that "we expect the president to set a final, increased refugee cap for the remainder of this fiscal year by May 15."
Meanwhile, America’s Voice, a progressive immigration reform proponent, said in a statement earlier that, “This is bad policy and bad politics.”
“As a policy matter, there is no valid policy reason to maintain the shockingly low refugee cap. As a political matter, President Biden will alienate a lot of his supporters by failing to turn the page on President Trump’s racism, xenophobia and scapegoating of immigrants and refugees,” the group said.', '2021-04-17 07:35:32', 4, 4);
INSERT INTO public.article VALUES (36, 'Silicon Valley leaders think A.I. will one day fund free cash handouts. But experts aren’t convinced', 'https://image.cnbcfm.com/api/v1/image/105706954-1548787619733gettyimages-862869678.jpeg', 'In as little as 10 years, AI could generate enough wealth to pay every adult in the U.S. $13,500 a year, OpenAI CEO Sam Altman said in his 2,933 word piece called “Moore’s Law for Everything.”', 'Artificial intelligence companies could become so powerful and so wealthy that they’re able to provide a universal basic income to every man, woman and child on Earth.
That’s how some in the AI community have interpreted a lengthy blog post from Sam Altman, the CEO of research lab OpenAI, that was published earlier this month. 
In as little as 10 years, AI could generate enough wealth to pay every adult in the U.S. $13,500 a year, Altman said in his 2,933 word piece called “Moore’s Law for Everything.
“My work at OpenAI reminds me every day about the magnitude of the socioeconomic change that is coming sooner than most people believe,” said Altman, the former president of renowned start-up accelerator Y-Combinator earlier this month. “Software that can think and learn will do more and more of the work that people now do.”
But critics are concerned that Altman’s views could cause more harm than good, and that he’s misleading the public on where AI is headed.
Glen Weyl, an economist and a principal researcher at Microsoft Research, wrote on Twitter: “This beautifully epitomizes the AI ideology that I believe is the most dangerous force in the world today.”
One industry source, who asked to remain anonymous due to the nature of the discussion, told CNBC that Altman “envisions a world wherein he and his AI-CEO peers become so immensely powerful that they run every non-AI company (employing people) out of business and every American worker to unemployment. So powerful that a percentage of OpenAI’s (and its peers’) income could bankroll UBI for every citizen of America.”
Altman will be able to “get away with it,” the source said, because “politicians will be enticed by his immense tax revenue and by the popularity that paying their voter’s salaries (UBI) will give them. But this is an illusion. Sam is no different from any other capitalist trying to persuade the government to allow an oligarchy.” 
Beth Singler, an anthropologist at the University of Cambridge who studies AI and robots, told CNBC: “Overly relying on corporate taxes for human survival and flourishing has always seemed a mistake to me.”
She added: “Are we going to get Star Trek luxury space (pseudo) communism or Wall-E redundancy?”
Taxing capital
One of the main thrusts of the essay is a call to tax capital — companies and land — instead of labor. That’s where the UBI money would come from.
“We could do something called the American Equity Fund,” wrote Altman. “The American Equity Fund would be capitalized by taxing companies above a certain valuation 2.5% of their market value each year, payable in shares transferred to the fund, and by taxing 2.5% of the value of all privately-held land, payable in dollars.”
He added: “All citizens over 18 would get an annual distribution, in dollars and company shares, into their accounts. People would be entrusted to use the money however they needed or wanted — for better education, healthcare, housing, starting a company, whatever.”
Altman said every citizen would get more money from the fund each year, providing the country keeps doing better.
“Every citizen would therefore increasingly partake of the freedoms, powers, autonomies, and opportunities that come with economic self-determination,” he said. “Poverty would be greatly reduced and many more people would have a shot at the life they want.”
Matt Clifford, the co-founder of start-up builder Entrepreneur First, wrote in his “Thoughts in Between” newsletter: “I don’t think there is anything intellectually radical here ... these ideas have been around for a long time — but it’s fascinating as a showcase of how mainstream these previously fringe ideas have become among tech elites.”
Meanwhile, Matt Prewitt, president of non-profit RadicalxChange, which describes itself as a global movement for next-generation political economies, told CNBC: “The piece sells a vision of the future that lets our future overlords off way too easy, and would likely create a sort of peasant class encompassing most of society.”
He added: “I can imagine even worse futures — but this the wrong direction in which to point our imaginations. By focusing instead on guaranteeing and enabling deeper, broader participation in political and economic life, I think we can do far better.”
Richard Miller, founder of tech consultancy firm Miller-Klein Associates, told CNBC that Altman’s post feels “muddled,” adding that “the model is unfettered capitalism.”
Michael Jordan, an academic at University of California Berkeley, told CNBC the blog post is too far from anything intellectually reasonable, either from a technology point of view, or an economic point of view, that he’d prefer not to comment.
In Altman’s defense, he wrote in his blog that the idea is designed to be little more than a “conversation starter.” Altman did not immediately reply to a CNBC request for an interview.
An OpenAI spokesperson encouraged people to read the essay for themselves.
Not everyone disagreed with Altman. “I like the suggested wealth taxation strategies,” wrote Deloitte worker Janine Moir on Twitter.
A.I.’s abilities
Founded in San Francisco in 2015 by a group of entrepreneurs including Elon Musk, OpenAI is widely regarded as one of the top AI labs in the world, along with Facebook AI Research, and DeepMind, which was acquired by Google in 2014.
The research lab, backed by Microsoft with $1 billion in July 2019, is best known for creating an AI image generator, called Dall-E, and an AI text generator, known as GPT-3. It has also developed agents that can beat the best humans at games like Dota 2. But it’s nowhere near creating the AI technology that Altman describes, experts told CNBC.
Daron Acemoglu, an economist at MIT, told CNBC: “There is an incredible mistaken optimism of what AI is capable of doing.”
Acemoglu said algorithms are good at performing some “very, very narrow tasks” and that they can sometimes help businesses to cut costs or improve a product.
“But they’re not that revolutionary, and there’s no evidence that any of this is going to be revolutionary,” he said, adding that AI leaders are “waxing lyrical about what AI is doing already and how it’s revolutionizing things.”
In terms of the measures that are standard for economic success, like total factor productivity growth, or output per worker, many sectors are having the worst time they’ve had in about 100 years, Acemoglu said. “It’s not comparable to previous periods of rapid technological progress,” he said.
“If you look at the 1950s and the 1960s, the rate of TFP (total factor productivity) growth was about 3% a year,” said Acemoglu. “Today it’s about 0.5%. What that means is you’re losing about a point and a half percentage growth of GDP (gross domestic product) every year so it’s a really huge, huge, huge productivity slowdown. It’s completely inconsistent with this view that we’re just getting an enormous amount of benefits (from AI).”
Technology evangelists have been saying AI will change the world for years with some speculating that “artificial general intelligence” and “superintelligence” isn’t far away.
AGI is the hypothetical ability of an AI to understand or learn any intellectual task that a human being can, while superintelligence is defined by Oxford professor Nick Bostrom as “any intellect that greatly exceeds the cognitive performance of humans in virtually all domains of interest.”
But some argue that we’re no closer to AGI or superintelligence than we were at the start of the century.
“One can say, and some do, ‘oh it’s just around the corner.’ But the premise of that doesn’t seem to be very well articulated. It was just around the corner 10 years ago and it hasn’t come,” said Acemoglu.', '2021-04-01 07:35:32', 4, 5);
INSERT INTO public.article VALUES (37, 'NFL player LeSean McCoy wants to build a real estate empire using opportunity zones', 'https://image.cnbcfm.com/api/v1/image/106869147-1618516038479-gettyimages-1230129599-357201213138_MV_at_TB.jpeg', 'The company develops properties using opportunity zones. The legislation was created out of the federal 2017 Tax Cuts and Jobs Act. NFL running back LeSean McCoy has 60 properties, some operating under his Vice Capital real estate firm.', 'National Football League running back LeSean McCoy admitted he had no clue how to handle finances earlier in his career. McCoy didn’t know how to make money from his large NFL paychecks, and saving wasn’t an option, either.
“Now being in my 12th year in the league, looking at all the investments I’ve made from the good to the bad, I think I’ve learned,” McCoy told CNBC.
It’s National Financial Literacy Month, and McCoy says he’s more motivated to further “generate finances not only for myself but also for my family.”
Months after getting his second Super Bowl ring, as McCoy was on the Tampa Bay Buccaneers roster, the 32-year-old player is using the offseason downtime to finish real estate developments. McCoy and his brother LeRon operate real estate firm Vice Capital. With McCoy’s playing days almost over, he’s using the real estate investment route to continue building wealth post-NFL.
“We’re still starting up, but that is the main goal,” said LeSean. He added another mission is to help NFL players learn “how to make money other than just playing football.”
Using the Opportunity Zones
Vice Capital invests in distressed properties in lower-income communities, renovating buildings to create new housing units and commercial space.
The McCoy brothers use opportunity zones to develop some properties. The areas were created as part of the federal Tax Cuts and Jobs Act of 2017 and provide developers capital gains tax incentives. They’re designed to direct investment to under-developed sections of cities and help increase neighborhood values without triggering a rise in rent that would drive residents out of the rebuilt communities.
LeSean’s brother told him about the zones in 2017. But LeSean said he was skeptical when he learned the legislation was passed under President Donald Trump’s administration. “Who is this really for?” he asked his brother.
Before it became official, the legislation was supported by U.S. senators including Sen. Cory Booker, (D-NJ) and Sen. Tim Scott, (R-SC). After researching legislation and identifying the tax exemptions, LeSean determined it was a “win-win.”
“And on the other side, as a humanitarian, you’re able to affect certain communities that need that change,” added LeRon. “Those are usually inner-city areas.”
Former NBA player David Robinson also uses opportunity zones for development.
The McCoy brothers have 60 properties, some of which operate under Vice, including buildings in hometown of Harrisburg, Pennsylvania, and in Philadelphia and where he played with the Eagles for six seasons.
“We want to build that empire in real estate,” LeSean said.
All about trust
LeRon played in the NFL for the 2005 season with the Arizona Cardinals. LeSean played 12 seasons, was selected to six Pro Bowls, and was on the Kansas City Chiefs team that won Super Bowl LIV. LeSean has made $63 million in his career, according to Spotrac.
LeSean asked his brother to help operate Vice, which he launched in 2018, while he maintained his NFL career.
“The hard part for players is trusting,” LeSean said. “My brother is a guy that I trust like no other, so that’s probably why it works so well with real estate. He’s constantly teaching me.”
During Covid-19, LeSean trusted LeRon to handle losses accumulated for the firm, as construction was halted and residents occupying units had eviction protection. LeRon didn’t disclose financials to CNBC but said Vice’s losses were less than $2 million.
“We’re brothers, but he would fire me,” LeRon joked. “The biggest loss that I can pinpoint isn’t dollars but the opportunity.”
Before the pandemic, LeRon said Vice Capital was in negotiations to purchase a property near La Salle University in Philadelphia’s Germantown neighborhood. The property decreased in value, but when Covid-19 spiked real estate prices, the owner took it off the market then relisted it at double the previous price, putting it out of Vice’s range.
LeRon said the pandemic “put a strain on things” as materials like lumber have soared, increasing construction costs. “But I would also say it’s made the seller’s market more magnified,” he added. “Interest levels are cheap, and everyone wants to buy.”
It’s here that LeSean is trusting his brother again. LeSean’s in favor of selling some properties with prices high in a red hot real estate market. LeRon is against the idea.  
“Sometimes we agree on things, and sometimes we don’t,” LeSean added. “But the good thing about our bond is that I can trust him with business.”
The McCoy brothers can’t unload the Opportunity Zone properties, though. Investors get tax breaks on their capital gains if they leave their money in a selected community for at least 10 years.
What’s next on the field?
Though LeSean counts on his brother for business advice, he still needs to decide on his career as the 2021 season nears. LeSean says he wants to play but remained uncertain about a teams’ interest.
“There are some teams that I probably won’t play for that reached out,” he said. “Other teams, hopefully, we can get an agreement on some things. It’s got to make sense.”
Recapping his 2020 season, LeSean said playing with Bucs quarterback Tom Brady was a “great experience.” 
“The whole journey, to see and play with him... I scrimmaged against him when I played in Philadelphia (Brady was then with New England). He was like a drill Sergeant, and then actually playing with him, I could see it. He’s so intense and smart,” LeSean said. “I’ve never played with a quarterback like that where he’s 43. It was cool to see.”
If retirement is near, LeSean said he has options and real estate is the main play. Asked about stocks or investing in bitcoin, LeSean said he tried the investments but is no longer interested.
“My thing is real estate,” LeSean said. “That is something I understand. I don’t need to take someone else’s word for it and the ups and downs – it’s just a lot. With real estate, I can see what’s going on; I can see my money, touch it and feel it.”', '2021-04-17 10:35:32', 4, 6);
INSERT INTO public.article VALUES (38, 'How Amazon fought the union drive in Alabama', 'https://image.cnbcfm.com/api/v1/image/106857451-16164321232021-03-22t165444z_1660276391_rc2ggm90miqk_rtrmadp_0_usa-amazon-labor.jpeg', 'Last week, workers at one of Amazon’s Alabama warehouses overwhelmingly voted against joining the Retail, Wholesale and Department Store Union, delivering a blow to labor organizers.', 'Amazon last week soundly defeated a union drive at one of its Alabama warehouses, a major win for the e-commerce giant, which has long fought unionization attempts at its facilities. 
Workers at the Bessemer, Alabama, warehouse voted overwhelmingly in favor of rejecting unionization, with fewer than 30% of the votes tallied in favor. The Retail, Wholesale and Department Store Union, which led the union drive, intends to challenge the outcome, arguing that Amazon broke the law with some of its anti-union activity before and during voting.
The outcome delivers a setback to organized labor, which had hoped the Bessemer election would help establish a foothold at Amazon. But unions, worker advocates and some employees at the Bessemer facility, known as BHM1, said they believe that the Bessemer election will fuel further organizing attempts at other warehouses across the country. Labor leaders say the Bessemer election also revealed to the general public the lengths to which employers will go to prevent unions.
According to multiple workers and union representatives who described the tactics, Amazon unleashed an aggressive public relations campaign at BHM1, including text messages to employees, leaflets, a website that urged workers to “do it without dues” and fliers posted in bathrooms that urged workers to “vote ‘NO.’”
Amazon’s greatest opportunity to influence workers came in the form of so-called captive audience meetings, which workers were required to attend during their shift. Amazon held the meetings weekly from late January up until ballots were sent out in early February. Workers sat for approximately 30 minutes through PowerPoint presentations discouraging unionization and were given the opportunity to ask Amazon representatives questions.  
Captive audience meetings are a common tactic used by employers during union campaigns. Supporters of proposed labor law reforms, such as the Protecting the Right to Organize Act, which awaits passage in the Senate, have argued that captive audience meetings serve as a forum for employers to deliver anti-union messages “without giving the union an opportunity to respond.” The PRO Act would prohibit employers from making these meetings mandatory.
Amazon said it hosted ongoing meetings in small groups as a way for employees to get all the facts about joining a union and about the election process itself.
The company also defended its response to the union campaign more broadly, arguing in a statement following the result that workers “heard far more anti-Amazon messages from the union, policymakers and media outlets than they heard from us.”
Why some voted ‘no’
Amazon’s messaging in the meetings was more convincing for some BHM1 workers than others.
One Bessemer employee, who started working at Amazon last year, said he felt Amazon used some scare tactics when talking to workers about the union but also told CNBC he didn’t understand how the union would help workers at BHM1. This person, who asked for anonymity to prevent retaliation, said the RWDSU did not explain what they were going to do for workers and did not respond to his request for information about how they had helped employees at other job sites.
Beyond his doubts about the RWDSU, this employee said he’s also had a primarily positive experience working for Amazon. While some workers complained about the stressful, demanding nature of the job, he said a previous construction job prepared him for the physical labor of warehouse work, so he finds it easy. Amazon’s pay and benefits are also a step up from his previous job.
In the end, this worker voted against unionization.
In private Facebook groups where Amazon workers engage with each other, other BHM1 employees shared their thoughts about the union campaign. One worker feared that if the union was voted in, employees would lose access to certain benefits provided by Amazon, such as its upskilling program, where Amazon pays a percentage of tuition costs to train warehouse workers for jobs in other high-demand fields.
Another worker felt that a union wasn’t necessary, asserting that if you work hard you can succeed at Amazon: “I voted no. Amazon is just a game, with rules. Learn the rules, play the game, move up, win.”
Mandatory meetings
Some BHM1 workers found Amazon’s anti-union messaging too aggressive.
One BHM1 employee who works as a stower, which involves transferring items into vacant storage bins throughout the facility, said Amazon designed the texts, fliers and mandatory meetings to convey a message that the union wouldn’t help anybody. This worker requested anonymity out of concern for losing his job.
The worker, who voted for the union, said he was wary of showing support for unionization in front of Amazon and his coworkers, and was nervous to ask questions, instead playing dumb to avoid getting fired.
In one mandatory meeting held before ballots were distributed in February, this worker said, Amazon sought to cast doubt on how workers’ dues would be spent by telling workers that the RWDSU spent more than $100,000 a year on vehicles for employees. The worker was skeptical of Amazon’s presentation, thinking that Amazon likely spent a lot more on cars each year than the union did.
Union President Stuart Appelbaum said in an interview that the RWDSU purchases cars for some representatives whose job it is to travel from workplace to workplace to represent and service members. 
Amazon said it wanted to explain to workers, particularly those with no previous knowledge of unions, that a union is a business that collects dues and explain how those dues may be used.
In another mandatory meeting, the two Bessemer workers told CNBC, Amazon circulated examples of previous contracts the RWDSU had won, trying to highlight the union’s shortcomings. Amazon also asserted that the RWDSU was primarily a poultry workers’ union that had limited experience representing warehouse workers. 
Appelbaum said poultry workers make up a significant share of the RWDSU’s membership in Alabama, and many of the organizers who led the campaign, and approached Amazon workers outside BHM1 as they wrapped up their shifts, came from nearby poultry plants. The union also represents workers in other industries, including retail, food production, nonprofit and cannabis, said RWDSU spokesperson Chelsea Connor.
In response to questions about whether it characterized the RWDSU as a poultry union, Amazon said it sought to highlight to workers how well, or poorly, the union might understand their employer.
During the meetings, Amazon also sought to highlight negative outcomes that could arise from voting for the union. Amazon told workers the union could force workers to go on strike and that employees could lose their benefits in the future, workers told CNBC.
The RWDSU’s Mid-South office, which led the organizing at Amazon, countered Amazon’s claim that the union would force BHM1 workers to go on strike, calling it a “fear tactic,” according to communications distributed to workers. 
“Amazon has insinuated that the union will ‘pull you out on a strike,’” said Randy Hadley, president of the Mid-South Council, in a February letter to workers, which also addresses other claims made by Amazon. “Here are the facts, our membership and our membership ONLY controls whether or not to strike by a super majority. This means nearly 4,000 Amazon workers would have to vote to go on strike. A strike can be useful when needed, but it is also very, very rare. This is yet another fear tactic by Amazon.”
Amazon said it sought to point out to workers that if a union is voted in, the union could call for a strike, as it’s the union’s main leverage over an employer.
In response to questions asking whether it told workers they could lose their benefits if a union is voted in, Amazon said it looked to inform employees, as part of general education about unions, that there are many outcomes that can result from collective bargaining negotiations.
Not the last effort
Amazon employees, labor leaders and worker advocates are hopeful that the loss in Alabama won’t be the last attempt at organizing the retail giant’s sprawling workforce. 
There may be future campaigns at BHM1, too. The worker who voted for the union said some pro-union employees have discussed the possibility of approaching the Teamsters and pursuing a future union campaign at their warehouse.
Elsewhere, Amazon workers and labor unions are considering different organizing strategies. The Teamsters is communicating with Amazon drivers and warehouse workers at a facility in Iowa and considering paths to rally workers beyond the election process. Amazon workers in Chicago have formed a group to organize employees at facilities in the area, called Amazonians United Chicagoland.
A worker at an Amazon facility in New Jersey, who also requested anonymity, said they previously approached a union about organizing their facility. After seeing the outcome in Bessemer, the worker said they’re going back to the drawing board and looking into more informal tactics for achieving leverage.
Susan Schurman, a professor at Rutgers University’s School of Management and Labor Relations, pointed to the Alphabet Workers Union, a recently formed minority union of more than 800 Google employees, as a potential model for Amazon workers.
Unlike traditional unions, minority unions don’t represent the majority of workers, only those who opt to join. They also aren’t recognized by the NLRB, and they don’t act as bargaining agents with employers.
However, Schurman said minority unions can serve as a “pathway to majority unions” and can be a powerful tool for building worker support even before launching a formal campaign with the NLRB.
“Why not stay and build an organization and keep at it?” Schurman said. “Let workers recruit new members and demonstrate the value of a collective negotiating power.”
Appelbaum, the RWDSU president, said a minority union strategy is “well worth thinking about.”
“We haven’t made a decision on that yet, but I think we’ll look at it,” Appelbaum said. “We know we’re not going away.”', '2021-04-16 16:35:32', 4, 7);
INSERT INTO public.article VALUES (39, '‘Tacky’ to ‘demoralizing’: Travel writers share their biggest ‘bucket list’ disappointments’', 'https://image.cnbcfm.com/api/v1/image/106869332-1618546575538-gettyimages-1074570876-221218matt_cardy001.jpeg', 'So-called bucket list destinations come with big expectations — and often big crowds too. While overtourism can ruin many a holiday destination, it’s not the only reason vacations miss the mark. Here, travel writers who contribute to CNBC’s Global Traveler share the worst disappointments of their professional careers.', 'Stonehenge, UK
“Although I may have my passport taken away for saying this as an Englishman, I found Stonehenge decidedly underwhelming.
“It didn’t help that at the time I was a university student working as a tour guide, so [I] had to convince 45 Americans on our bus that they were about to undergo a life-changing experience: seeing up close a 4,500-year-old testament to man’s ceaseless creativity, brilliance and spiritualism.
“What emerged through the rain was a slightly forlorn collection of large gray stones, about 30 yards away — as close as we could get. A broken-down truck on a busy road running alongside the site didn’t exactly help the mystic revelation.”
—Chris Dwyer, United Kingdom
Ha Long Bay, Vietnam
“The karst-studded seascape in northern Vietnam is one of the country’s undisputed visual highlights, but the reality of visiting is not always so alluring. I’ve been there several times — first as a tourist and then on assignment — and I’ve struggled to see the charm of the destination despite its obvious beauty.
“From the identikit junk boats that gridlock the water to dispiriting excursions to unremarkable caves and floating communities selling tacky souvenirs, it’s a tourism experience that requires an upgrade.”
—Duncan Forgan, United Kingdom
Bhutan
“Curious and fascinated by the tales about the “Land of the Thunder Dragon,” I went [to Bhutan] to explore culture and country and to photograph the Paro Tshechu festival. These religious dance festivals started in the 17th century and are indeed worth seeing. The festivities are held in monasteries across the country every year and go on for five days. Buddhist monks perform 1,300-year-old dance rites wearing exquisitely embroidered costumes and colorful masks.
“As Bhutan bans independent travel, a local tour guide and a driver accompanied me on my journey through the country. Chats with them revealed the lack of prospects Bhutan’s young generation faces — limitations on education, no jobs, no money.
“I knew that roaming freely between cities and changing the itinerary ad hoc wasn’t allowed. My two chaperones even tried to hold me back from straying off the city’s main streets. Ignoring their protests, I pressed ahead into the back roads. Life there exposed the sobering truth of an image carefully crafted for the outside world. Instead of happiness, alcoholism, poverty and violence drive many of Bhutan’s residents’ destiny.”
—Petra Loho, Austria
Machu Picchu, Peru
“It was a place that I had always dreamed about: a lost city, high in the Andes hidden from the rest of the world.
“I knew there was no road linking this Inca kingdom to the outside world, and that to get there one had to take a train then bus, or hike the rugged Inca Trail for up to 10 days. Lacking such time, I opted for the train from Cuzco. The locals selling overpriced trinkets up and down the aisles might have been a signal for me to adjust my expectations.
“The buses were crowded with people who looked just like me. Barely able to maneuver around one another, they inched around hairpin turns — choked in exhaust from other vehicles — to the top of the mountain. A crowd of vendors surrounded the entry gate to Machu Picchu.
“For a moment, a breathtaking view of magnificence unfolded before me as if I had just awoken from a dream — until a long line of people under the leadership of a red flag-toting tour guide descended the rocky stairway where I was standing, almost knocking me aside.
“Wherever I walked, wherever I looked, there were people in throngs, pressing tightly against each other, waiting to squeeze into an archway or corridor to get the perfect selfie. The shuffle of people was slow and laborious, and all I wanted to do was leap from the narrow path we were all forced to follow.
“I managed to slip away from crowds to gaze at the remarkable sights and vistas for just a few minutes at a time before others came along, trying to do the same. It was exhausting and demoralizing. When I finally sat back on the train I felt relieved to be away from the masses, yet sadly unsatisfied that I had barely experienced — and not even seen all of — the hallowed ‘Lost City of the Incas.’” 
—Kevin Cox, United States
Venice, Italy
“The unique poignancy of this floating city’s atmospheric canals, medieval bridges and iconic crumbling palazzos puts Venice firmly on many a bucket list. Admittedly, sailing into the Port of Venice on the final leg of a memorable Crystal Serenity Adriatic Antiquities cruise was a dream come true. Once disembarked in the sweltering August heat — nostrils assailed by the suffocating stench of ancient canals — and reality set in.
“Long lines of hot and sweaty sightseers waited for overpriced gondolas and vaporettos manned by irritable tourism industry workers (not Venetians themselves — hardly anyone actually lives in Venice). It was a salutary reminder that I’d broken a cardinal rule of European travel: Don’t visit the big cities in summer! Choose April, May, or even June. Or, wait until things cool off in September or October.”
—Verne Maree, South Africa
Arashiyama Bamboo Grove, Kyoto, Japan
“The bamboo forests of Arashiyama have been heavily burdened by their Insta-worthy fame. Because everyone aiming for that perfect social media moment waits for groups to clear before taking their pictures there, the crowds never disperse along the green stretches.
“In all honesty, I’ve seen similar swathes of bamboo in Vietnam and China. But those seeking a dose of tranquility when in Arashiyama can find it near the end of one trail: Gioji Temple boasts a moss garden, maple trees and undisturbed bamboo groves.”
—Morgan Awyong, Singapore
Choquequirao, Peru
“We were in Peru, a country that has treasures beyond measure. Even Machu Picchu, which is so hyped you might think it could never live up to expectations, was utterly amazing. Our final adventure was a hike to Choquequirao, another ancient Incan site.
“When we told locals where we going, they greeted the news with disbelief. Little did we know, this is one hard trip. [It’s] all uphill to get there, although normally the mountains would be covered in cloud. Not this time. It was hot; the sun was fierce. Its rays bounced off the shale on the switchbacks burning our eyes. And it just got hotter. Plus, there was no time to linger because we were on a short timeline.
“At sunset, after two extraordinarily challenging days, we made it to Santa Rosa. In the distance, we could see the gates. That was when the guide told us we wouldn’t have time to go to the ruins. It was another two hours walk there, and he had to have us back in Cusco in less than 48 hours.
“Disappointed? Oh, just a little. It’d be great to return one day, but this time I’d make sure there was ample time to enjoy it.”
—Carrie Hutchinson, Australia', '2021-04-16 05:35:32', 4, 8);
INSERT INTO public.article VALUES (40, 'People are buying more ‘above the mask’ makeup during the pandemic, Ulta CEO says', 'https://image.cnbcfm.com/api/v1/image/106597482-1598387905010-nord.jpg', '“Above the mask” makeup, like eyeliner, mascara and brow products did well during the pandemic, Ulta CEO Mary Dillon told CNBC.', 'Spending more time indoors hasn’t stopped people from wanting to wear makeup, Ulta CEO Mary Dillon told CNBC on Thursday.
“We see more of what we call “above the mask,” like eyes and brows and lashes, and we see that makeup in general is starting to come back,” Dillion said in a “Squawk Box” interview. “It’s just a matter of how long will it take for people to be in a situation when they’re not needing to wear a mask in a more social situation.”
In Ulta’s makeup category, consumers are purchasing more products like eyeliner, mascara and brow products. At the same time, they’re not worrying too much about products like lipstick and blush, since they go unseen under the mask.
Skin care is also seeing a great surge in interest during the pandemic.
“It started with things like self care. People had more time to learn about skin care to put a bunch of new skin care routines into their procedure because they have more time at home,” said Dillion, who is stepping aside in June to become executive chair.
In addition, Dillon said the hair care, fragrance and clean beauty categories also fared well during the pandemic.
Despite uncertainty about the pandemic, she is cautiously optimistic about the industry’s growth.
“I think the spending is going to continue to accelerate, but we’re not sure when that’s going to happen, so we will be cautious for the first half of the year,” said Dillon, who will be succeeded by Ulta President Dave Kimbell.
Ulta stock was down 1.4% in morning trading.', '2021-04-18 05:35:32', 4, 9);
INSERT INTO public.article VALUES (43, 'This is title', 'https://photo-baomoi.zadn.vn/w700_r1/2020_04_15_180_34718461/cf6ada6aa3294a771338.jpg', 'This is short introduction', 'This is content, so long ...', '2021-05-12 06:40:05.068', 9, 2);
INSERT INTO public.article VALUES (50, 'This is titleeeee', 'https://photo-baomoi.zadn.vn/w700_r1/2020_04_15_180_34718461/cf6ada6aa3294a7713381.jpg', 'This is short introductiond1', 'This is content, so long d...1', '2021-05-12 07:51:49.336', 9, 3);
INSERT INTO public.article VALUES (51, 'While enabling such access is important for all data', 'https://znews-photo.zadn.vn/w660/Uploaded/ofh_btgazspf/2020_04_21/72425168_2190164277756889_5548989457421565952_o.jpg', 'While enabling such access is important for all data', 'While enabling such access is important for all data', '2021-05-12 09:36:40.305', 8, 6);
INSERT INTO public.article VALUES (60, 'ABCD', 'ABCD', 'ABCD', 'ABCD', '2021-05-12 10:16:45.514', 8, 1);
INSERT INTO public.article VALUES (62, 'ABCD', 'ABCD', 'ABCD', 'ABCD', '2021-05-12 10:18:46.757', 8, 1);
INSERT INTO public.article VALUES (63, 'ABCD', 'ABCD', 'ABCD', 'ABCD', '2021-05-12 10:18:48.861', 8, 1);


--
-- TOC entry 4031 (class 0 OID 10544906)
-- Dependencies: 204
-- Data for Name: article_tag; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.article_tag VALUES (1, 2);
INSERT INTO public.article_tag VALUES (1, 3);
INSERT INTO public.article_tag VALUES (1, 4);
INSERT INTO public.article_tag VALUES (1, 5);
INSERT INTO public.article_tag VALUES (1, 6);
INSERT INTO public.article_tag VALUES (1, 7);
INSERT INTO public.article_tag VALUES (1, 8);
INSERT INTO public.article_tag VALUES (2, 9);
INSERT INTO public.article_tag VALUES (2, 10);
INSERT INTO public.article_tag VALUES (2, 4);
INSERT INTO public.article_tag VALUES (2, 11);
INSERT INTO public.article_tag VALUES (2, 12);
INSERT INTO public.article_tag VALUES (2, 13);
INSERT INTO public.article_tag VALUES (3, 14);
INSERT INTO public.article_tag VALUES (3, 15);
INSERT INTO public.article_tag VALUES (3, 16);
INSERT INTO public.article_tag VALUES (3, 17);
INSERT INTO public.article_tag VALUES (3, 18);
INSERT INTO public.article_tag VALUES (3, 19);
INSERT INTO public.article_tag VALUES (3, 20);
INSERT INTO public.article_tag VALUES (3, 21);
INSERT INTO public.article_tag VALUES (3, 22);
INSERT INTO public.article_tag VALUES (4, 23);
INSERT INTO public.article_tag VALUES (4, 24);
INSERT INTO public.article_tag VALUES (4, 25);
INSERT INTO public.article_tag VALUES (4, 26);
INSERT INTO public.article_tag VALUES (4, 27);
INSERT INTO public.article_tag VALUES (4, 28);
INSERT INTO public.article_tag VALUES (4, 29);
INSERT INTO public.article_tag VALUES (5, 30);
INSERT INTO public.article_tag VALUES (5, 4);
INSERT INTO public.article_tag VALUES (5, 31);
INSERT INTO public.article_tag VALUES (5, 32);
INSERT INTO public.article_tag VALUES (5, 33);
INSERT INTO public.article_tag VALUES (5, 34);
INSERT INTO public.article_tag VALUES (5, 35);
INSERT INTO public.article_tag VALUES (6, 36);
INSERT INTO public.article_tag VALUES (6, 37);
INSERT INTO public.article_tag VALUES (6, 38);
INSERT INTO public.article_tag VALUES (7, 39);
INSERT INTO public.article_tag VALUES (7, 40);
INSERT INTO public.article_tag VALUES (7, 41);
INSERT INTO public.article_tag VALUES (7, 42);
INSERT INTO public.article_tag VALUES (7, 43);
INSERT INTO public.article_tag VALUES (7, 44);
INSERT INTO public.article_tag VALUES (7, 45);
INSERT INTO public.article_tag VALUES (8, 46);
INSERT INTO public.article_tag VALUES (8, 47);
INSERT INTO public.article_tag VALUES (8, 48);
INSERT INTO public.article_tag VALUES (8, 16);
INSERT INTO public.article_tag VALUES (8, 15);
INSERT INTO public.article_tag VALUES (8, 49);
INSERT INTO public.article_tag VALUES (9, 50);
INSERT INTO public.article_tag VALUES (9, 51);
INSERT INTO public.article_tag VALUES (9, 52);
INSERT INTO public.article_tag VALUES (10, 53);
INSERT INTO public.article_tag VALUES (10, 54);
INSERT INTO public.article_tag VALUES (10, 55);
INSERT INTO public.article_tag VALUES (10, 56);
INSERT INTO public.article_tag VALUES (10, 57);
INSERT INTO public.article_tag VALUES (10, 58);
INSERT INTO public.article_tag VALUES (10, 59);
INSERT INTO public.article_tag VALUES (11, 60);
INSERT INTO public.article_tag VALUES (11, 61);
INSERT INTO public.article_tag VALUES (12, 4);
INSERT INTO public.article_tag VALUES (12, 62);
INSERT INTO public.article_tag VALUES (12, 63);
INSERT INTO public.article_tag VALUES (12, 35);
INSERT INTO public.article_tag VALUES (12, 64);
INSERT INTO public.article_tag VALUES (13, 65);
INSERT INTO public.article_tag VALUES (13, 66);
INSERT INTO public.article_tag VALUES (13, 67);
INSERT INTO public.article_tag VALUES (13, 68);
INSERT INTO public.article_tag VALUES (14, 69);
INSERT INTO public.article_tag VALUES (14, 70);
INSERT INTO public.article_tag VALUES (14, 71);
INSERT INTO public.article_tag VALUES (14, 72);
INSERT INTO public.article_tag VALUES (14, 73);
INSERT INTO public.article_tag VALUES (15, 74);
INSERT INTO public.article_tag VALUES (15, 75);
INSERT INTO public.article_tag VALUES (15, 76);
INSERT INTO public.article_tag VALUES (15, 77);
INSERT INTO public.article_tag VALUES (15, 78);
INSERT INTO public.article_tag VALUES (16, 79);
INSERT INTO public.article_tag VALUES (16, 80);
INSERT INTO public.article_tag VALUES (16, 81);
INSERT INTO public.article_tag VALUES (17, 39);
INSERT INTO public.article_tag VALUES (17, 40);
INSERT INTO public.article_tag VALUES (17, 82);
INSERT INTO public.article_tag VALUES (17, 83);
INSERT INTO public.article_tag VALUES (18, 84);
INSERT INTO public.article_tag VALUES (18, 85);
INSERT INTO public.article_tag VALUES (18, 86);
INSERT INTO public.article_tag VALUES (19, 52);
INSERT INTO public.article_tag VALUES (19, 87);
INSERT INTO public.article_tag VALUES (19, 88);
INSERT INTO public.article_tag VALUES (19, 89);
INSERT INTO public.article_tag VALUES (20, 90);
INSERT INTO public.article_tag VALUES (20, 57);
INSERT INTO public.article_tag VALUES (20, 91);
INSERT INTO public.article_tag VALUES (21, 92);
INSERT INTO public.article_tag VALUES (21, 93);
INSERT INTO public.article_tag VALUES (22, 94);
INSERT INTO public.article_tag VALUES (22, 5);
INSERT INTO public.article_tag VALUES (22, 95);
INSERT INTO public.article_tag VALUES (23, 96);
INSERT INTO public.article_tag VALUES (23, 66);
INSERT INTO public.article_tag VALUES (23, 67);
INSERT INTO public.article_tag VALUES (23, 68);
INSERT INTO public.article_tag VALUES (24, 97);
INSERT INTO public.article_tag VALUES (24, 95);
INSERT INTO public.article_tag VALUES (24, 98);
INSERT INTO public.article_tag VALUES (24, 99);
INSERT INTO public.article_tag VALUES (25, 76);
INSERT INTO public.article_tag VALUES (25, 100);
INSERT INTO public.article_tag VALUES (25, 101);
INSERT INTO public.article_tag VALUES (26, 102);
INSERT INTO public.article_tag VALUES (26, 103);
INSERT INTO public.article_tag VALUES (26, 19);
INSERT INTO public.article_tag VALUES (27, 39);
INSERT INTO public.article_tag VALUES (27, 40);
INSERT INTO public.article_tag VALUES (27, 44);
INSERT INTO public.article_tag VALUES (27, 41);
INSERT INTO public.article_tag VALUES (27, 42);
INSERT INTO public.article_tag VALUES (28, 104);
INSERT INTO public.article_tag VALUES (28, 105);
INSERT INTO public.article_tag VALUES (28, 106);
INSERT INTO public.article_tag VALUES (28, 107);
INSERT INTO public.article_tag VALUES (28, 108);
INSERT INTO public.article_tag VALUES (29, 52);
INSERT INTO public.article_tag VALUES (29, 109);
INSERT INTO public.article_tag VALUES (29, 110);
INSERT INTO public.article_tag VALUES (29, 111);
INSERT INTO public.article_tag VALUES (30, 57);
INSERT INTO public.article_tag VALUES (30, 112);
INSERT INTO public.article_tag VALUES (30, 43);
INSERT INTO public.article_tag VALUES (31, 113);
INSERT INTO public.article_tag VALUES (31, 114);
INSERT INTO public.article_tag VALUES (32, 115);
INSERT INTO public.article_tag VALUES (32, 74);
INSERT INTO public.article_tag VALUES (32, 116);
INSERT INTO public.article_tag VALUES (33, 117);
INSERT INTO public.article_tag VALUES (33, 118);
INSERT INTO public.article_tag VALUES (34, 60);
INSERT INTO public.article_tag VALUES (34, 61);
INSERT INTO public.article_tag VALUES (34, 119);
INSERT INTO public.article_tag VALUES (35, 32);
INSERT INTO public.article_tag VALUES (35, 4);
INSERT INTO public.article_tag VALUES (35, 34);
INSERT INTO public.article_tag VALUES (36, 120);
INSERT INTO public.article_tag VALUES (36, 121);
INSERT INTO public.article_tag VALUES (37, 122);
INSERT INTO public.article_tag VALUES (37, 123);
INSERT INTO public.article_tag VALUES (37, 41);
INSERT INTO public.article_tag VALUES (38, 124);
INSERT INTO public.article_tag VALUES (38, 125);
INSERT INTO public.article_tag VALUES (38, 126);
INSERT INTO public.article_tag VALUES (39, 127);
INSERT INTO public.article_tag VALUES (39, 128);
INSERT INTO public.article_tag VALUES (40, 129);
INSERT INTO public.article_tag VALUES (40, 130);
INSERT INTO public.article_tag VALUES (1, 1);
INSERT INTO public.article_tag VALUES (43, 1);
INSERT INTO public.article_tag VALUES (43, 2);
INSERT INTO public.article_tag VALUES (43, 3);
INSERT INTO public.article_tag VALUES (43, 4);
INSERT INTO public.article_tag VALUES (50, 1);
INSERT INTO public.article_tag VALUES (50, 2);
INSERT INTO public.article_tag VALUES (50, 3);
INSERT INTO public.article_tag VALUES (50, 4);
INSERT INTO public.article_tag VALUES (50, 5);
INSERT INTO public.article_tag VALUES (50, 6);
INSERT INTO public.article_tag VALUES (51, 71);
INSERT INTO public.article_tag VALUES (51, 127);
INSERT INTO public.article_tag VALUES (64, 79);


--
-- TOC entry 4032 (class 0 OID 10544909)
-- Dependencies: 205
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.category VALUES (1, 'Business');
INSERT INTO public.category VALUES (2, 'Entertainment');
INSERT INTO public.category VALUES (3, 'Health');
INSERT INTO public.category VALUES (4, 'Politics');
INSERT INTO public.category VALUES (5, 'Science');
INSERT INTO public.category VALUES (6, 'Sports');
INSERT INTO public.category VALUES (7, 'Technology');
INSERT INTO public.category VALUES (8, 'Travel');
INSERT INTO public.category VALUES (9, 'Fashion');
INSERT INTO public.category VALUES (10, 'Security');


--
-- TOC entry 4034 (class 0 OID 10544914)
-- Dependencies: 207
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4036 (class 0 OID 10544922)
-- Dependencies: 209
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tag VALUES (1, 'fdi');
INSERT INTO public.tag VALUES (2, 'insurance');
INSERT INTO public.tag VALUES (3, 'congress');
INSERT INTO public.tag VALUES (4, 'us');
INSERT INTO public.tag VALUES (5, 'india');
INSERT INTO public.tag VALUES (6, 'parliament');
INSERT INTO public.tag VALUES (7, 'law');
INSERT INTO public.tag VALUES (8, 'charbot');
INSERT INTO public.tag VALUES (9, 'portland');
INSERT INTO public.tag VALUES (10, 'riot');
INSERT INTO public.tag VALUES (11, 'protest');
INSERT INTO public.tag VALUES (12, 'murder');
INSERT INTO public.tag VALUES (13, 'police');
INSERT INTO public.tag VALUES (14, 'queen');
INSERT INTO public.tag VALUES (15, 'instagram');
INSERT INTO public.tag VALUES (16, 'picture');
INSERT INTO public.tag VALUES (17, 'prince');
INSERT INTO public.tag VALUES (18, 'funeral');
INSERT INTO public.tag VALUES (19, 'past');
INSERT INTO public.tag VALUES (20, 'private');
INSERT INTO public.tag VALUES (21, 'royal');
INSERT INTO public.tag VALUES (22, 'family');
INSERT INTO public.tag VALUES (23, 'brain');
INSERT INTO public.tag VALUES (24, 'development');
INSERT INTO public.tag VALUES (25, 'children');
INSERT INTO public.tag VALUES (26, 'negativity');
INSERT INTO public.tag VALUES (27, 'concept');
INSERT INTO public.tag VALUES (28, 'strategy');
INSERT INTO public.tag VALUES (29, 'mentality');
INSERT INTO public.tag VALUES (30, 'russia');
INSERT INTO public.tag VALUES (31, 'putin');
INSERT INTO public.tag VALUES (32, 'biden');
INSERT INTO public.tag VALUES (33, 'sanctions');
INSERT INTO public.tag VALUES (34, 'president');
INSERT INTO public.tag VALUES (35, 'national');
INSERT INTO public.tag VALUES (36, 'ocean');
INSERT INTO public.tag VALUES (37, 'explore');
INSERT INTO public.tag VALUES (38, 'navy');
INSERT INTO public.tag VALUES (39, 'e-sports');
INSERT INTO public.tag VALUES (40, 'league-of-legends');
INSERT INTO public.tag VALUES (41, 'tournament');
INSERT INTO public.tag VALUES (42, 'championship');
INSERT INTO public.tag VALUES (43, 'korea');
INSERT INTO public.tag VALUES (44, 'china');
INSERT INTO public.tag VALUES (45, 'moba');
INSERT INTO public.tag VALUES (46, 'nasa');
INSERT INTO public.tag VALUES (47, 'space');
INSERT INTO public.tag VALUES (48, 'satellite');
INSERT INTO public.tag VALUES (49, 'world');
INSERT INTO public.tag VALUES (50, 'kenya');
INSERT INTO public.tag VALUES (51, 'euro');
INSERT INTO public.tag VALUES (52, 'tourism');
INSERT INTO public.tag VALUES (53, 'hoodie');
INSERT INTO public.tag VALUES (54, 'art');
INSERT INTO public.tag VALUES (55, 'virtual');
INSERT INTO public.tag VALUES (56, 'overprice');
INSERT INTO public.tag VALUES (57, 'trend');
INSERT INTO public.tag VALUES (58, 'nft');
INSERT INTO public.tag VALUES (59, 'gucci');
INSERT INTO public.tag VALUES (60, 'covid');
INSERT INTO public.tag VALUES (61, 'vaccine');
INSERT INTO public.tag VALUES (62, 'iran');
INSERT INTO public.tag VALUES (63, 'retaliatory');
INSERT INTO public.tag VALUES (64, 'military');
INSERT INTO public.tag VALUES (65, 'rose');
INSERT INTO public.tag VALUES (66, 'blackpink');
INSERT INTO public.tag VALUES (67, 'k-pop');
INSERT INTO public.tag VALUES (68, 'music');
INSERT INTO public.tag VALUES (69, 'human');
INSERT INTO public.tag VALUES (70, 'monkey');
INSERT INTO public.tag VALUES (71, 'ethics');
INSERT INTO public.tag VALUES (72, 'debate');
INSERT INTO public.tag VALUES (73, 'embryo');
INSERT INTO public.tag VALUES (74, 'government');
INSERT INTO public.tag VALUES (75, 'meeting');
INSERT INTO public.tag VALUES (76, 'vietnam');
INSERT INTO public.tag VALUES (77, 'hanoi');
INSERT INTO public.tag VALUES (78, 'prime-minister');
INSERT INTO public.tag VALUES (79, 'extraterrestrial');
INSERT INTO public.tag VALUES (80, 'earth');
INSERT INTO public.tag VALUES (81, 'dust');
INSERT INTO public.tag VALUES (82, 'europe');
INSERT INTO public.tag VALUES (83, 'toxic');
INSERT INTO public.tag VALUES (84, 'climate-change');
INSERT INTO public.tag VALUES (85, 'global-warming');
INSERT INTO public.tag VALUES (86, 'white');
INSERT INTO public.tag VALUES (87, 'quang-ninh');
INSERT INTO public.tag VALUES (88, 'green-growth');
INSERT INTO public.tag VALUES (89, 'cave');
INSERT INTO public.tag VALUES (90, 'sandals');
INSERT INTO public.tag VALUES (91, 'shoes');
INSERT INTO public.tag VALUES (92, 'inflation');
INSERT INTO public.tag VALUES (93, 'cramer');
INSERT INTO public.tag VALUES (94, 'terrorism');
INSERT INTO public.tag VALUES (95, 'death');
INSERT INTO public.tag VALUES (96, 'jisoo');
INSERT INTO public.tag VALUES (97, 'poison');
INSERT INTO public.tag VALUES (98, 'denmark');
INSERT INTO public.tag VALUES (99, 'salmonella');
INSERT INTO public.tag VALUES (100, 'brunei');
INSERT INTO public.tag VALUES (101, 'committee');
INSERT INTO public.tag VALUES (102, 'meteor');
INSERT INTO public.tag VALUES (103, 'antarctica');
INSERT INTO public.tag VALUES (104, 'lego');
INSERT INTO public.tag VALUES (105, 'mario');
INSERT INTO public.tag VALUES (106, 'games');
INSERT INTO public.tag VALUES (107, 'nintendo');
INSERT INTO public.tag VALUES (108, 'toys');
INSERT INTO public.tag VALUES (109, 'hon-son');
INSERT INTO public.tag VALUES (110, 'kien-giang');
INSERT INTO public.tag VALUES (111, 'island');
INSERT INTO public.tag VALUES (112, 'street-style');
INSERT INTO public.tag VALUES (113, 'apple');
INSERT INTO public.tag VALUES (114, 'appstore');
INSERT INTO public.tag VALUES (115, 'microsoft');
INSERT INTO public.tag VALUES (116, 'update');
INSERT INTO public.tag VALUES (117, 'lord-of-the-rings');
INSERT INTO public.tag VALUES (118, 'movies');
INSERT INTO public.tag VALUES (119, 'johnson-and-johnson');
INSERT INTO public.tag VALUES (120, 'silicon-valley');
INSERT INTO public.tag VALUES (121, 'open-ai');
INSERT INTO public.tag VALUES (122, 'football');
INSERT INTO public.tag VALUES (123, 'nfl');
INSERT INTO public.tag VALUES (124, 'amazon');
INSERT INTO public.tag VALUES (125, 'alabama');
INSERT INTO public.tag VALUES (126, 'voting');
INSERT INTO public.tag VALUES (127, 'writers');
INSERT INTO public.tag VALUES (128, 'bucket-list');
INSERT INTO public.tag VALUES (129, 'mask');
INSERT INTO public.tag VALUES (130, 'makeup');


--
-- TOC entry 4048 (class 0 OID 0)
-- Dependencies: 201
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.account_id_seq', 11, true);


--
-- TOC entry 4049 (class 0 OID 0)
-- Dependencies: 203
-- Name: article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.article_id_seq', 64, true);


--
-- TOC entry 4050 (class 0 OID 0)
-- Dependencies: 206
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.category_id_seq', 10, true);


--
-- TOC entry 4051 (class 0 OID 0)
-- Dependencies: 208
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comment_id_seq', 1, true);


--
-- TOC entry 4052 (class 0 OID 0)
-- Dependencies: 210
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tag_id_seq', 130, true);


--
-- TOC entry 3874 (class 2606 OID 10544951)
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- TOC entry 3876 (class 2606 OID 10544953)
-- Name: account account_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_username_key UNIQUE (username);


--
-- TOC entry 3878 (class 2606 OID 10544957)
-- Name: article article_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (id);


--
-- TOC entry 3880 (class 2606 OID 10975013)
-- Name: article_tag article_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.article_tag
    ADD CONSTRAINT article_tag_pkey PRIMARY KEY (articleid, tagid);


--
-- TOC entry 3882 (class 2606 OID 10544959)
-- Name: category category_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_name_key UNIQUE (name);


--
-- TOC entry 3884 (class 2606 OID 10544961)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3886 (class 2606 OID 10544963)
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- TOC entry 3888 (class 2606 OID 10544965)
-- Name: tag tag_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_name_key UNIQUE (name);


--
-- TOC entry 3890 (class 2606 OID 10544967)
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- TOC entry 3891 (class 2606 OID 10544968)
-- Name: article article_accountid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_accountid_fkey FOREIGN KEY (accountid) REFERENCES public.account(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3892 (class 2606 OID 10544973)
-- Name: article article_categoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_categoryid_fkey FOREIGN KEY (categoryid) REFERENCES public.category(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3893 (class 2606 OID 10544978)
-- Name: article_tag article_tag_articleid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.article_tag
    ADD CONSTRAINT article_tag_articleid_fkey FOREIGN KEY (articleid) REFERENCES public.article(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 3894 (class 2606 OID 10544983)
-- Name: article_tag article_tag_tagid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.article_tag
    ADD CONSTRAINT article_tag_tagid_fkey FOREIGN KEY (tagid) REFERENCES public.tag(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 3895 (class 2606 OID 10544988)
-- Name: comment comment_accountid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_accountid_fkey FOREIGN KEY (accountid) REFERENCES public.account(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 3896 (class 2606 OID 10544993)
-- Name: comment comment_articleid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_articleid_fkey FOREIGN KEY (articleid) REFERENCES public.article(id) ON UPDATE RESTRICT ON DELETE CASCADE;


-- Completed on 2021-05-13 17:26:39

--
-- PostgreSQL database dump complete
--

