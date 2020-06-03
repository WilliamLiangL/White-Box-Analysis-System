package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * carcinoma检测表 sys_carcinoma
 * 
 * @author ruoyi
 * @date 2020-05-06
 */
public class Carcinoma extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** id */
	private Integer carcinomaId;
	/**  */
	@Excel(name = "alcoholism")
	private String alcoholism;
	/**  */
	@Excel(name = "vh_amn")
	private String vh_amn;
	/**  */
	@Excel(name = "hepatotoxic")
	private String hepatotoxic;
	/**  */
	@Excel(name = "THepatitis")
	private String THepatitis;
	/**  */
	@Excel(name = "hospital")
	private String hospital;
	/**  */
	@Excel(name = "surgery")
	private String surgery;
	/**  */
	@Excel(name = "gallstones")
	private String gallstones;
	/**  */
	@Excel(name = "choledocholithotomy")
	private String choledocholithotomy;
	/**  */
	@Excel(name = "injections")
	private String injections;
	/**  */
	@Excel(name = "transfusion")
	private String transfusion;
	/**  */
	@Excel(name = "ChHepatitis")
	private String ChHepatitis;
	/**  */
	@Excel(name = "sex")
	private String sex;
	/** 年龄 */
	@Excel(name = "age")
	private String age;
	/**  */
	@Excel(name = "PBC")
	private String PBC;
	/**  */
	@Excel(name = "fibrosis")
	private String fibrosis;
	/**  */
	@Excel(name = "diabetes")
	private String diabetes;
	/**  */
	@Excel(name = "obesity")
	private String obesity;
	/**  */
	@Excel(name = "Steatosis")
	private String Steatosis;
	/**  */
	@Excel(name = "Cirrhosis")
	private String Cirrhosis;
	/**  */
	@Excel(name = "Hyperbilirubinemia")
	private String Hyperbilirubinemia;
	/**  */
	@Excel(name = "triglycerides")
	private String triglycerides;
	/**  */
	@Excel(name = "RHepatitis")
	private String RHepatitis;
	/**  */
	@Excel(name = "fatigue")
	private String fatigue;
	/**  */
	@Excel(name = "bilirubin")
	private String bilirubin;
	/**  */
	@Excel(name = "itching")
	private String itching;
	/**  */
	@Excel(name = "upper_pain")
	private String upper_pain;
	/**  */
	@Excel(name = "fat")
	private String fat;
	/**  */
	@Excel(name = "pain_ruq")
	private String pain_ruq;
	/**  */
	@Excel(name = "pressure_ruq")
	private String pressure_ruq;
	/**  */
	@Excel(name = "phosphatase")
	private String phosphatase;
	/**  */
	@Excel(name = "skin")
	private String skin;
	/**  */
	@Excel(name = "ama")
	private String ama;
	/**  */
	@Excel(name = "le_cells")
	private String le_cells;
	/**  */
	@Excel(name = "joints")
	private String joints;
	/**  */
	@Excel(name = "pain")
	private String pain;
	/**  */
	@Excel(name = "proteins")
	private String proteins;
	/**  */
	@Excel(name = "edema")
	private String edema;
	/**  */
	@Excel(name = "platelet")
	private String platelet;
	/**  */
	@Excel(name = "inr")
	private String inr;
	/**  */
	@Excel(name = "bleeding")
	private String bleeding;
	/**  */
	@Excel(name = "flatulence")
	private String flatulence;
	/**  */
	@Excel(name = "alcohol")
	private String alcohol;
	/**  */
	@Excel(name = "encephalopathy")
	private String encephalopathy;
	/**  */
	@Excel(name = "urea")
	private String urea;
	/**  */
	@Excel(name = "ascites")
	private String ascites;
	/**  */
	@Excel(name = "hepatomegaly")
	private String hepatomegaly;
	/**  */
	@Excel(name = "hepatalgia")
	private String hepatalgia;
	/**  */
	@Excel(name = "density")
	private String density;
	/**  */
	@Excel(name = "ESR")
	private String ESR;
	/**  */
	@Excel(name = "alt")
	private String alt;
	/**  */
	@Excel(name = "ast")
	private String ast;
	/**  */
	@Excel(name = "amylase")
	private String amylase;
	/**  */
	@Excel(name = "ggtp")
	private String ggtp;
	/**  */
	@Excel(name = "cholesterol")
	private String cholesterol;
	/**  */
	@Excel(name = "hbsag")
	private String hbsag;
	/**  */
	@Excel(name = "hbsag_anti")
	private String hbsag_anti;
	/**  */
	@Excel(name = "anorexia")
	private String anorexia;
	/**  */
	@Excel(name = "nausea")
	private String nausea;
	/**  */
	@Excel(name = "spleen")
	private String spleen;
	/**  */
	@Excel(name = "consciousness")
	private String consciousness;
	/**  */
	@Excel(name = "spiders")
	private String spiders;
	/**  */
	@Excel(name = "jaundice")
	private String jaundice;
	/**  */
	@Excel(name = "albumin")
	private String albumin;
	/**  */
	@Excel(name = "edge")
	private String edge;
	/**  */
	@Excel(name = "irregular_liver")
	private String irregular_liver;
	/**  */
	@Excel(name = "hbc_anti")
	private String hbc_anti;
	/**  */
	@Excel(name = "hcv_anti")
	private String hcv_anti;
	/**  */
	@Excel(name = "palms")
	private String palms;
	/**  */
	@Excel(name = "hbeag")
	private String hbeag;

	public void setCarcinomaId(Integer carcinomaId) 
	{
		this.carcinomaId = carcinomaId;
	}
	public Integer getCarcinomaId()
	{
		return carcinomaId;
	}

	public void setAlcoholism(String alcoholism)
	{
		this.alcoholism = alcoholism;
	}
	public String getAlcoholism()
	{
		return alcoholism;
	}

	public void setVh_amn(String vh_amn)
	{
		this.vh_amn = vh_amn;
	}
	public String getVh_amn()
	{
		return vh_amn;
	}

	public void setHepatotoxic(String hepatotoxic)
	{
		this.hepatotoxic = hepatotoxic;
	}
	public String getHepatotoxic()
	{
		return hepatotoxic;
	}

	public void setTHepatitis(String THepatitis)
	{
		this.THepatitis = THepatitis;
	}
	public String getTHepatitis()
	{
		return THepatitis;
	}

	public void setHospital(String hospital)
	{
		this.hospital = hospital;
	}
	public String getHospital()
	{
		return hospital;
	}

	public void setSurgery(String surgery)
	{
		this.surgery = surgery;
	}
	public String getSurgery()
	{
		return surgery;
	}

	public void setGallstones(String gallstones)
	{
		this.gallstones = gallstones;
	}
	public String getGallstones()
	{
		return gallstones;
	}

	public void setCholedocholithotomy(String choledocholithotomy)
	{
		this.choledocholithotomy = choledocholithotomy;
	}
	public String getCholedocholithotomy()
	{
		return choledocholithotomy;
	}

	public void setInjections(String injections)
	{
		this.injections = injections;
	}
	public String getInjections()
	{
		return injections;
	}

	public void setTransfusion(String transfusion)
	{
		this.transfusion = transfusion;
	}
	public String getTransfusion()
	{
		return transfusion;
	}

	public void setChHepatitis(String ChHepatitis)
	{
		this.ChHepatitis = ChHepatitis;
	}
	public String getChHepatitis()
	{
		return ChHepatitis;
	}

	public void setSex(String sex)
	{
		this.sex = sex;
	}
	public String getSex()
	{
		return sex;
	}

	public void setAge(String age)
	{
		this.age = age;
	}
	public String getAge()
	{
		return age;
	}

	public void setPBC(String PBC)
	{
		this.PBC = PBC;
	}
	public String getPBC()
	{
		return PBC;
	}

	public void setFibrosis(String fibrosis)
	{
		this.fibrosis = fibrosis;
	}
	public String getFibrosis()
	{
		return fibrosis;
	}

	public void setDiabetes(String diabetes)
	{
		this.diabetes = diabetes;
	}
	public String getDiabetes()
	{
		return diabetes;
	}

	public void setObesity(String obesity)
	{
		this.obesity = obesity;
	}
	public String getObesity()
	{
		return obesity;
	}

	public void setSteatosis(String Steatosis)
	{
		this.Steatosis = Steatosis;
	}
	public String getSteatosis()
	{
		return Steatosis;
	}

	public void setCirrhosis(String Cirrhosis)
	{
		this.Cirrhosis = Cirrhosis;
	}
	public String getCirrhosis()
	{
		return Cirrhosis;
	}

	public void setHyperbilirubinemia(String Hyperbilirubinemia)
	{
		this.Hyperbilirubinemia = Hyperbilirubinemia;
	}
	public String getHyperbilirubinemia()
	{
		return Hyperbilirubinemia;
	}

	public void setTriglycerides(String triglycerides)
	{
		this.triglycerides = triglycerides;
	}
	public String getTriglycerides()
	{
		return triglycerides;
	}

	public void setRHepatitis(String RHepatitis)
	{
		this.RHepatitis = RHepatitis;
	}
	public String getRHepatitis()
	{
		return RHepatitis;
	}

	public void setFatigue(String fatigue)
	{
		this.fatigue = fatigue;
	}
	public String getFatigue()
	{
		return fatigue;
	}

	public void setBilirubin(String bilirubin)
	{
		this.bilirubin = bilirubin;
	}
	public String getBilirubin()
	{
		return bilirubin;
	}

	public void setItching(String itching)
	{
		this.itching = itching;
	}
	public String getItching()
	{
		return itching;
	}

	public void setUpper_pain(String upper_pain)
	{
		this.upper_pain = upper_pain;
	}
	public String getUpper_pain()
	{
		return upper_pain;
	}

	public void setFat(String fat)
	{
		this.fat = fat;
	}
	public String getFat()
	{
		return fat;
	}

	public void setPain_ruq(String pain_ruq)
	{
		this.pain_ruq = pain_ruq;
	}
	public String getPain_ruq()
	{
		return pain_ruq;
	}

	public void setPressure_ruq(String pressure_ruq)
	{
		this.pressure_ruq = pressure_ruq;
	}
	public String getPressure_ruq()
	{
		return pressure_ruq;
	}

	public void setPhosphatase(String phosphatase)
	{
		this.phosphatase = phosphatase;
	}
	public String getPhosphatase()
	{
		return phosphatase;
	}

	public void setSkin(String skin)
	{
		this.skin = skin;
	}
	public String getSkin()
	{
		return skin;
	}

	public void setAma(String ama)
	{
		this.ama = ama;
	}
	public String getAma()
	{
		return ama;
	}

	public void setLe_cells(String le_cells)
	{
		this.le_cells = le_cells;
	}
	public String getLe_cells()
	{
		return le_cells;
	}

	public void setJoints(String joints)
	{
		this.joints = joints;
	}
	public String getJoints()
	{
		return joints;
	}

	public void setPain(String pain)
	{
		this.pain = pain;
	}
	public String getPain()
	{
		return pain;
	}

	public void setProteins(String proteins)
	{
		this.proteins = proteins;
	}
	public String getProteins()
	{
		return proteins;
	}

	public void setEdema(String edema)
	{
		this.edema = edema;
	}
	public String getEdema()
	{
		return edema;
	}

	public void setPlatelet(String platelet)
	{
		this.platelet = platelet;
	}
	public String getPlatelet()
	{
		return platelet;
	}

	public void setInr(String inr)
	{
		this.inr = inr;
	}
	public String getInr()
	{
		return inr;
	}

	public void setBleeding(String bleeding)
	{
		this.bleeding = bleeding;
	}
	public String getBleeding()
	{
		return bleeding;
	}

	public void setFlatulence(String flatulence)
	{
		this.flatulence = flatulence;
	}
	public String getFlatulence()
	{
		return flatulence;
	}

	public void setAlcohol(String alcohol)
	{
		this.alcohol = alcohol;
	}
	public String getAlcohol()
	{
		return alcohol;
	}

	public void setEncephalopathy(String encephalopathy)
	{
		this.encephalopathy = encephalopathy;
	}
	public String getEncephalopathy() 
	{
		return encephalopathy;
	}

	public void setUrea(String urea)
	{
		this.urea = urea;
	}
	public String getUrea()
	{
		return urea;
	}

	public void setAscites(String ascites)
	{
		this.ascites = ascites;
	}
	public String getAscites()
	{
		return ascites;
	}

	public void setHepatomegaly(String hepatomegaly)
	{
		this.hepatomegaly = hepatomegaly;
	}
	public String getHepatomegaly()
	{
		return hepatomegaly;
	}

	public void setHepatalgia(String hepatalgia)
	{
		this.hepatalgia = hepatalgia;
	}
	public String getHepatalgia()
	{
		return hepatalgia;
	}

	public void setDensity(String density)
	{
		this.density = density;
	}
	public String getDensity()
	{
		return density;
	}

	public void setESR(String ESR)
	{
		this.ESR = ESR;
	}
	public String getESR()
	{
		return ESR;
	}

	public void setAlt(String alt)
	{
		this.alt = alt;
	}
	public String getAlt()
	{
		return alt;
	}

	public void setAst(String ast)
	{
		this.ast = ast;
	}
	public String getAst()
	{
		return ast;
	}

	public void setAmylase(String amylase)
	{
		this.amylase = amylase;
	}
	public String getAmylase()
	{
		return amylase;
	}

	public void setGgtp(String ggtp)
	{
		this.ggtp = ggtp;
	}
	public String getGgtp()
	{
		return ggtp;
	}

	public void setCholesterol(String cholesterol)
	{
		this.cholesterol = cholesterol;
	}
	public String getCholesterol()
	{
		return cholesterol;
	}

	public void setHbsag(String hbsag)
	{
		this.hbsag = hbsag;
	}
	public String getHbsag()
	{
		return hbsag;
	}

	public void setHbsag_anti(String hbsag_anti)
	{
		this.hbsag_anti = hbsag_anti;
	}
	public String getHbsag_anti()
	{
		return hbsag_anti;
	}

	public void setAnorexia(String anorexia)
	{
		this.anorexia = anorexia;
	}
	public String getAnorexia() 
	{
		return anorexia;
	}

	public void setNausea(String nausea)
	{
		this.nausea = nausea;
	}
	public String getNausea()
	{
		return nausea;
	}

	public void setSpleen(String spleen)
	{
		this.spleen = spleen;
	}
	public String getSpleen()
	{
		return spleen;
	}

	public void setConsciousness(String consciousness)
	{
		this.consciousness = consciousness;
	}
	public String getConsciousness()
	{
		return consciousness;
	}

	public void setSpiders(String spiders)
	{
		this.spiders = spiders;
	}
	public String getSpiders()
	{
		return spiders;
	}

	public void setJaundice(String jaundice)
	{
		this.jaundice = jaundice;
	}
	public String getJaundice()
	{
		return jaundice;
	}

	public void setAlbumin(String albumin)
	{
		this.albumin = albumin;
	}
	public String getAlbumin()
	{
		return albumin;
	}

	public void setEdge(String edge)
	{
		this.edge = edge;
	}
	public String getEdge()
	{
		return edge;
	}

	public void setIrregular_liver(String irregular_liver)
	{
		this.irregular_liver = irregular_liver;
	}
	public String getIrregular_liver()
	{
		return irregular_liver;
	}

	public void setHbc_anti(String hbc_anti)
	{
		this.hbc_anti = hbc_anti;
	}
	public String getHbc_anti()
	{
		return hbc_anti;
	}

	public void setHcv_anti(String hcv_anti)
	{
		this.hcv_anti = hcv_anti;
	}
	public String getHcv_anti()
	{
		return hcv_anti;
	}

	public void setPalms(String palms)
	{
		this.palms = palms;
	}
	public String getPalms()
	{
		return palms;
	}

	public void setHbeag(String hbeag)
	{
		this.hbeag = hbeag;
	}
	public String getHbeag()
	{
		return hbeag;
	}

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("carcinomaId", getCarcinomaId())
            .append("alcoholism", getAlcoholism())
            .append("vh_amn", getVh_amn())
            .append("hepatotoxic", getHepatotoxic())
            .append("THepatitis", getTHepatitis())
            .append("hospital", getHospital())
            .append("surgery", getSurgery())
            .append("gallstones", getGallstones())
            .append("choledocholithotomy", getCholedocholithotomy())
            .append("injections", getInjections())
            .append("transfusion", getTransfusion())
            .append("ChHepatitis", getChHepatitis())
            .append("sex", getSex())
            .append("age", getAge())
            .append("PBC", getPBC())
            .append("fibrosis", getFibrosis())
            .append("diabetes", getDiabetes())
            .append("obesity", getObesity())
            .append("Steatosis", getSteatosis())
            .append("Cirrhosis", getCirrhosis())
            .append("Hyperbilirubinemia", getHyperbilirubinemia())
            .append("triglycerides", getTriglycerides())
            .append("RHepatitis", getRHepatitis())
            .append("fatigue", getFatigue())
            .append("bilirubin", getBilirubin())
            .append("itching", getItching())
            .append("upper_pain", getUpper_pain())
            .append("fat", getFat())
            .append("pain_ruq", getPain_ruq())
            .append("pressure_ruq", getPressure_ruq())
            .append("phosphatase", getPhosphatase())
            .append("skin", getSkin())
            .append("ama", getAma())
            .append("le_cells", getLe_cells())
            .append("joints", getJoints())
            .append("pain", getPain())
            .append("proteins", getProteins())
            .append("edema", getEdema())
            .append("platelet", getPlatelet())
            .append("inr", getInr())
            .append("bleeding", getBleeding())
            .append("flatulence", getFlatulence())
            .append("alcohol", getAlcohol())
            .append("encephalopathy", getEncephalopathy())
            .append("urea", getUrea())
            .append("ascites", getAscites())
            .append("hepatomegaly", getHepatomegaly())
            .append("hepatalgia", getHepatalgia())
            .append("density", getDensity())
            .append("ESR", getESR())
            .append("alt", getAlt())
            .append("ast", getAst())
            .append("amylase", getAmylase())
            .append("ggtp", getGgtp())
            .append("cholesterol", getCholesterol())
            .append("hbsag", getHbsag())
            .append("hbsag_anti", getHbsag_anti())
            .append("anorexia", getAnorexia())
            .append("nausea", getNausea())
            .append("spleen", getSpleen())
            .append("consciousness", getConsciousness())
            .append("spiders", getSpiders())
            .append("jaundice", getJaundice())
            .append("albumin", getAlbumin())
            .append("edge", getEdge())
            .append("irregular_liver", getIrregular_liver())
            .append("hbc_anti", getHbc_anti())
            .append("hcv_anti", getHcv_anti())
            .append("palms", getPalms())
            .append("hbeag", getHbeag())
            .toString();
    }
}
