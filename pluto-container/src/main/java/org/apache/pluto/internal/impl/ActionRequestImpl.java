/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.apache.pluto.internal.impl;

import java.io.IOException;

import javax.portlet.ActionRequest;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.pluto.Constants;
import org.apache.pluto.PortletContainer;
import org.apache.pluto.PortletWindow;
import org.apache.pluto.internal.InternalActionRequest;


/**
 * Implementation of the <code>javax.portlet.ActionRequest</code> interface.
 */
public class ActionRequestImpl extends ClientDataRequestImpl
                               implements ActionRequest, InternalActionRequest
{
    private static final Log LOG = LogFactory.getLog(ActionRequestImpl.class);

    public ActionRequestImpl(PortletContainer container,
                             PortletWindow portletWindow,
                             HttpServletRequest servletRequest)
    {
        super(container, portletWindow, servletRequest);
        if (LOG.isDebugEnabled())
        {
        	LOG.debug("Created action request for: " + portletWindow);
        }
    }

    protected Integer getRequestMethod()
    {
        return Constants.METHOD_ACTION;
    }

	public String getLifecyclePhase()
	{
		return ACTION_PHASE;
	}

    public ServletInputStream getInputStream() throws IOException
    {
        return (super.isIncluded() || super.isForwarded()) ? (ServletInputStream)getPortletInputStream() : super.getInputStream();
    }
}
